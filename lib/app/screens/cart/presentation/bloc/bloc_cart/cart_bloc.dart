// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:coffee_kst/app/screens/cart/domain/entities/cart.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/get_cart.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/remove_cart.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';
import 'package:coffee_kst/core/utils/constants.dart';
import 'package:coffee_kst/core/utils/constants_login.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartServiceBloc extends Bloc<CartServiceEvent, CartServiceState> {
  final GetCartUseCase getCartUseCase;
  final RemoveItemUseCase removeItemUseCase;
  CartServiceBloc(this.getCartUseCase, this.removeItemUseCase)
      : super(const CartServiceState()) {
    on<LoadCartEvent>(_handleLoadCart);
    on<RemoveItemCartLocalEvent>(_onRemoveItem);
    on<RemoveItemCartServerEvent>(_onRemoveItemServer);
    on<UpdateTotalCartEvent>(_onUpdateTotalCart);
    on<IncrementToppingEvent>(_onIncrementTopping);
    on<DecrementToppingEvent>(_onDecrementTopping);
    on<IncrementProductEvent>(_onIncrementProduct);
    on<DecrementProductEvent>(_onDecrementProduct);
  }
  _handleLoadCart(LoadCartEvent event, Emitter<CartServiceState> emit) async {
    emit(state.copyWith(state: CartLoading()));
    try {
      final result = await getCartUseCase.call(NoParams());
      result.fold(
        (Failure l) {
          if (l is InternetFailure) {
            emit(state.copyWith(
                messageError: MESSAGE_NOT_INTERNET, state: CartLoadFailed()));
          } else if (l is ServerFailure) {
            emit(state.copyWith(
                messageError: MESSAGE_SERVER_FAILURE, state: CartLoadFailed()));
          }
        },
        (List<CartEntity> r) {
          if (r.isEmpty) {
            emit(state.copyWith(state: CartDataEmpty()));
          } else {
            emit(state.copyWith(list: r, state: CartLoaded()));
            add(UpdateTotalCartEvent());
          }
        },
      );
    } catch (e) {
      emit(state.copyWith(messageError: e.toString(), state: CartLoadFailed()));
    }
  }

  _onRemoveItem(
      RemoveItemCartLocalEvent event, Emitter<CartServiceState> emit) {
    final state = this.state;
    state.list.removeWhere((element) => element.id == event.invoiceDetailId);
    emit(state.copyWith(list: state.list));
    add(RemoveItemCartServerEvent(
        invoiceDetailId: event.invoiceDetailId,
        productID: event.productID,
        sizeName: event.sizeName));
  }

  _onRemoveItemServer(
      RemoveItemCartServerEvent event, Emitter<CartServiceState> emit) async {
    try {
      final result = await removeItemUseCase.call(ParamsRemoveItem(
          invoiceDetailId: event.invoiceDetailId,
          productID: event.productID,
          sizeName: event.sizeName));
      result.fold(
        (Failure l) {
          if (l is InternetFailure) {
            emit(state.copyWith(
                messageError: MESSAGE_NOT_INTERNET, state: CartLoadFailed()));
          } else if (l is ServerFailure) {
            emit(state.copyWith(
                messageError: MESSAGE_SERVER_FAILURE, state: CartLoadFailed()));
          }
        },
        (int code) {
          if (code == SUCCESS_CODE) {
            if (state.list.isEmpty) {
              emit(state.copyWith(state: CartDataEmpty()));
            } else {
              emit(state.copyWith(state: CartLoaded()));
            }
            add(UpdateTotalCartEvent());
          } else {
            emit(state.copyWith(state: CartLoadFailed()));
          }
        },
      );
    } catch (e) {
      emit(state.copyWith(state: CartLoadFailed()));
    }
  }

  _onUpdateTotalCart(
      UpdateTotalCartEvent event, Emitter<CartServiceState> emit) async {
    final state = this.state;
    //[tính tổng giỏ hàng]
    final total =
        List<CartEntity>.from(state.list).fold(0, (previousValue, element) {
      final initial = previousValue as int;
      final totalTopping = List<ToppingEntity>.from(element.listTopping).fold(
        0,
        (value, element) {
          final initital = value as int;
          return initital + (element.price) * element.quantity;
        },
      );
      return initial +
          (int.parse(element.price) * element.quantity) +
          totalTopping;
    });
    emit(state.copyWith(total: total));
  }

  _onIncrementTopping(
      IncrementToppingEvent event, Emitter<CartServiceState> emit) async {
    final state = this.state;
    state.list[event.productIndex].listTopping[event.index].quantity += 1;
    emit(state.copyWith(list: state.list, state: CartLoaded()));
    add(UpdateTotalCartEvent());
  }

  _onDecrementTopping(
      DecrementToppingEvent event, Emitter<CartServiceState> emit) async {
    final state = this.state;
    final quantity =
        state.list[event.productIndex].listTopping[event.index].quantity;
    if (quantity == 1) {
      state.list[event.productIndex].listTopping.removeAt(event.index);
    } else {
      state.list[event.productIndex].listTopping[event.index].quantity -= 1;
    }
    emit(state.copyWith(list: state.list, state: CartLoaded()));
    add(UpdateTotalCartEvent());
  }

  _onIncrementProduct(
      IncrementProductEvent event, Emitter<CartServiceState> emit) {
    final state = this.state;
    state.list[event.productIndex].quantity += 1;
    emit(state.copyWith(list: state.list, state: CartLoaded()));
    add(UpdateTotalCartEvent());
  }

  _onDecrementProduct(
      DecrementProductEvent event, Emitter<CartServiceState> emit) {
    final state = this.state;
    final quantity = state.list[event.productIndex].quantity;
    if (quantity == 1) {
      return;
    } else {
      state.list[event.productIndex].quantity -= 1;
    }
    emit(state.copyWith(list: state.list, state: CartLoaded()));
    add(UpdateTotalCartEvent());
  }
}
