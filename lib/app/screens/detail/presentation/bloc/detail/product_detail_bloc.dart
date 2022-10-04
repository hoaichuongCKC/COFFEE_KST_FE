// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:coffee_kst/app/screens/detail/domain/entities/detail.dart';
import 'package:coffee_kst/app/screens/detail/domain/usecase/get_detail.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/utils/constants_login.dart';
import 'package:equatable/equatable.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final GetDetailUseCase getDetailUseCase;
  ProductDetailBloc(this.getDetailUseCase) : super(ProductDetailInitial()) {
    on<LoadProductDetailEvent>(_handleGetDetail);
    on<InitEvent>((event, emit) => emit(ProductDetailInitial()));
  }
  _handleGetDetail(
      LoadProductDetailEvent event, Emitter<ProductDetailState> emit) async {
    emit(ProductDetailLoading());
    try {
      final result =
          await getDetailUseCase.call(ParamDetail(productID: event.productID));
      result.fold(
        (Failure l) {
          if (l is InternetFailure) {
            emit(const ProductDetailLoadFailed(message: MESSAGE_NOT_INTERNET));
          } else if (l is ServerFailure) {
            emit(
                const ProductDetailLoadFailed(message: MESSAGE_SERVER_FAILURE));
          }
        },
        (DetailEnity r) {
          emit(ProductDetailLoaded(data: r));
        },
      );
    } catch (e) {
      emit(ProductDetailLoadFailed(message: e.toString()));
    }
  }
}
