// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:coffee_kst/app/screens/cart/domain/entities/cart.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/get_cart.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';
import 'package:coffee_kst/core/utils/constants_login.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartServiceBloc extends Bloc<CartServiceEvent, CartServiceState> {
  final GetCartUseCase getCartUseCase;
  CartServiceBloc(this.getCartUseCase) : super(CartInitial()) {
    on<LoadCartEvent>(_handleLoadCart);
  }
  _handleLoadCart(LoadCartEvent event, Emitter<CartServiceState> emit) async {
    emit(CartLoading());
    try {
      final result = await getCartUseCase.call(NoParams());
      result.fold(
        (Failure l) {
          if (l is InternetFailure) {
            emit(const CartLoadFailed(messageError: MESSAGE_NOT_INTERNET));
          } else if (l is ServerFailure) {
            emit(const CartLoadFailed(messageError: MESSAGE_SERVER_FAILURE));
          }
        },
        (List<CartEntity> r) {
          if (r.isEmpty) {
            emit(CartDataEmpty());
          } else {
            emit(CartLoaded(list: r));
          }
        },
      );
    } catch (e) {
      emit(CartLoadFailed(messageError: e.toString()));
    }
  }
}
