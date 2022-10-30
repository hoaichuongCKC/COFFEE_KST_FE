// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/add_to_cart.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/add_to_cart_is_not_empty.dart';
import 'package:coffee_kst/app/screens/detail/domain/entities/detail.dart';
import 'package:coffee_kst/app/screens/detail/domain/usecase/get_detail.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/utils/const_code_state.dart';
import 'package:coffee_kst/core/utils/constants.dart';
import 'package:coffee_kst/core/utils/constants_login.dart';
import 'package:equatable/equatable.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetaiServicelBloc
    extends Bloc<ProductDetailServiceEvent, ProductDetailServiceState> {
  final GetDetailUseCase getDetailUseCase;
  final AddToCartEmptyUseCase addToCartEmptyUseCase;
  final AddToCartIsNotEmptyUseCase addToCartIsNotEmptyUseCase;
  ProductDetaiServicelBloc(this.getDetailUseCase, this.addToCartEmptyUseCase,
      this.addToCartIsNotEmptyUseCase)
      : super(const ProductDetailServiceState()) {
    on<LoadProductDetailEvent>(_handleGetDetail);
    on<ResetEvent>((event, emit) => emit(const ProductDetailServiceState()));
    on<ChooseSizeEvent>((event, emit) {
      int currentPrice = state.defautlPrice;
      if (event.size == state.data.size1) {
        currentPrice = state.data.price1;
      } else if (event.size == state.data.size2) {
        currentPrice = state.data.price2;
      } else {
        currentPrice = state.data.price3;
      }
      emit(state.copyWith(
        sizeName: event.size,
        defautlPrice: currentPrice,
      ));
      add(UpdateTotalEvent());
    });
    on<InitDetailEvent>((event, emit) => emit(state.copyWith(
        sizeName: event.sizeName,
        total: event.total,
        productId: event.productID,
        defautlPrice: event.defaultPrice)));
    on<IncrementQuantityProductEvent>((event, emit) {
      emit(
        state.copyWith(quantity: state.quantity + 1),
      );
      add(UpdateTotalEvent());
    });
    on<DecrementQuantityProductEvent>((event, emit) {
      if (state.quantity > 1) {
        emit(state.copyWith(
            quantity: state.quantity - 1,
            total: state.defautlPrice * (state.quantity - 1)));
      }
      add(UpdateTotalEvent());
    });
    on<AddElementToppingEvent>((event, emit) {
      final state = this.state;
      bool isCheckExists = false;
      for (var element in List.from(state.listTopping)) {
        if (element.id == event.toppingParams.id) {
          //update quantity
          element.quantity += event.toppingParams.quantity;
          isCheckExists = true;
          add(UpdateTotalEvent());
          break;
        }
      }
      if (!isCheckExists) {
        emit(state.copyWith(
          listTopping: List.from(state.listTopping)..add(event.toppingParams),
        ));
        add(UpdateTotalEvent());
      }
    });
    on<RemoveElementToppingEvent>((event, emit) {
      final state = this.state;
      for (var element in List.from(state.listTopping)) {
        if (element.id == event.toppingId) {
          //update quantity
          if (element.quantity == 1) {
            state.listTopping
                .removeWhere((element) => element.id == event.toppingId);
          } else {
            element.quantity -= 1;
          }

          add(UpdateTotalEvent());
          break;
        }
      }
    });
    on<UpdateTotalEvent>((event, emit) {
      final total = List.from(state.listTopping)
          .fold(state.defautlPrice * state.quantity, (previousValue, element) {
        final initital = previousValue as int;
        return initital + (element.price * element.quantity);
      });
      emit(state.copyWith(total: total as int));
    });
    on<AddToCartEvent>(_handleAddToCart);
    on<AddToCartIsNotEmptyEvent>(_onAddToCartIsNotEmpty);
  }
  _handleGetDetail(LoadProductDetailEvent event,
      Emitter<ProductDetailServiceState> emit) async {
    emit(state.copyWith(state: ProductDetailLoading()));
    try {
      final result =
          await getDetailUseCase.call(ParamDetail(productID: event.productID));
      result.fold(
        (Failure l) {
          if (l is InternetFailure) {
            emit(state.copyWith(
                message: MESSAGE_NOT_INTERNET,
                state: ProductDetailLoadFailed()));
          } else if (l is ServerFailure) {
            emit(state.copyWith(
                message: MESSAGE_SERVER_FAILURE,
                state: ProductDetailLoadFailed()));
          }
        },
        (DetailEntity r) {
          add(InitDetailEvent(
            sizeName: r.size1,
            total: r.price1,
            productID: r.id,
            defaultPrice: r.price1,
          ));
          emit(state.copyWith(state: ProductDetailLoaded(), data: r));
        },
      );
    } catch (e) {
      emit(state.copyWith(
          message: e.toString(), state: ProductDetailLoadFailed()));
    }
  }

  _handleAddToCart(
      AddToCartEvent event, Emitter<ProductDetailServiceState> emit) async {
    emit(state.copyWith(codeState: SucessCode()));
    try {
      final result = await addToCartEmptyUseCase.call(
        ParamAddToCartEmpty(
            shippingAddress: '',
            shippingPhone: '',
            shippingName: '',
            total: state.total,
            quantity: state.quantity,
            productId: state.productId,
            sizeName: state.sizeName,
            price: state.defautlPrice,
            listToppings: state.listTopping),
      );
      result.fold((Failure l) {
        if (l is InternetFailure) {
          emit(state.copyWith(
              message: MESSAGE_NOT_INTERNET, state: ProductDetailLoadFailed()));
        } else if (l is ServerFailure) {
          emit(state.copyWith(
              message: MESSAGE_SERVER_FAILURE,
              state: ProductDetailLoadFailed()));
        }
      }, (int code) {
        if (code == SUCCESS_CODE) {
          emit(state.copyWith(
              message: "Thêm thành công!!", codeState: SucessCode()));
        } else if (code == FAILED_CODE) {
          emit(
              state.copyWith(message: "Lỗi server!!", codeState: FailedCode()));
        }
      });
    } catch (e) {
      emit(state.copyWith(message: e.toString(), codeState: FailedCode()));
    }
  }

  _onAddToCartIsNotEmpty(AddToCartIsNotEmptyEvent event,
      Emitter<ProductDetailServiceState> emit) async {
    emit(state.copyWith(codeState: SucessCode()));
    try {
      final result = await addToCartIsNotEmptyUseCase.call(
        ParamAddToCartIsNotEmpty(
            quantity: state.quantity,
            productId: state.productId,
            sizeName: state.sizeName,
            price: state.defautlPrice,
            listToppings: state.listTopping),
      );
      result.fold((Failure l) {
        if (l is InternetFailure) {
          emit(state.copyWith(
              message: MESSAGE_NOT_INTERNET, state: ProductDetailLoadFailed()));
        } else if (l is ServerFailure) {
          emit(state.copyWith(
              message: MESSAGE_SERVER_FAILURE,
              state: ProductDetailLoadFailed()));
        }
      }, (int code) {
        if (code == SUCCESS_CODE) {
          emit(state.copyWith(
              message: "Thêm thành công!!", codeState: SucessCode()));
        } else if (code == FAILED_CODE) {
          emit(
              state.copyWith(message: "Lỗi server!!", codeState: FailedCode()));
        }
      });
    } catch (e) {
      emit(state.copyWith(message: e.toString(), codeState: FailedCode()));
    }
  }
}
