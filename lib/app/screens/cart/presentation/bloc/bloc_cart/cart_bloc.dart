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
  CartServiceBloc(this.getCartUseCase) : super(const CartServiceState()) {
    on<LoadCartEvent>(_handleLoadCart);
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
          }
        },
      );
    } catch (e) {
      emit(state.copyWith(messageError: e.toString(), state: CartLoadFailed()));
    }
  }

  // _addToCartEvent(
  //     AddToCartEvent event, Emitter<ProductDetailServiceState> emit) async {
  //   try {
  //     final result = await addToCartEmptyUseCase.call(const ParamAddToCartEmpty(
  //         shippingAddress: 'shippingAddress',
  //         shippingPhone: 'shippingPhone',
  //         shippingName: 'shippingName',
  //         total: 0,
  //         quantity: 0,
  //         productId: 0,
  //         sizeName: 'sizeName',
  //         price: 0));
  //     result.fold(
  //       (Failure l) {
  //         if (l is InternetFailure) {
  //           emit(state.copyWith(
  //               message: MESSAGE_NOT_INTERNET,
  //               state: ProductDetailLoadFailed()));
  //         } else if (l is ServerFailure) {
  //           emit(state.copyWith(
  //               message: MESSAGE_SERVER_FAILURE,
  //               state: ProductDetailLoadFailed()));
  //         }
  //       },
  //       (int r) {},
  //     );
  //   } catch (e) {
  //     print('Lỗi try catch trong add to cart');
  //   }
  // }
}
