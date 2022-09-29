// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:bloc/bloc.dart';
import 'package:coffee_kst/app/screens/home/domain/entities/product.dart';
import 'package:coffee_kst/app/screens/home/domain/usecase/get_list_product.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';
import 'package:coffee_kst/core/utils/constants_login.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetListProductUseCase getListProductUseCase;
  ProductBloc(this.getListProductUseCase) : super(ProductInitial()) {
    on<LoadListProductEvent>(_handleLoadProductList);
  }
  void _handleLoadProductList(
      LoadListProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final result = await getListProductUseCase.call(NoParams());

      result.fold(
        (Failure result) {
          if (result is InternetFailure) {
            emit(const ProductLoadFailed(messageError: MESSAGE_NOT_INTERNET));
          } else if (result is ServerFailure) {
            emit(const ProductLoadFailed(messageError: MESSAGE_SERVER_FAILURE));
          }
        },
        (List<ProductEntity> r) {
          emit(ProductLoaded(list: r));
        },
      );
    } catch (e) {
      emit(ProductLoadFailed(messageError: e.toString()));
    }
  }
}
