// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:coffee_kst/app/screens/home/domain/entities/product_type.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';
import 'package:coffee_kst/core/utils/constants_login.dart';
import 'package:equatable/equatable.dart';

import 'package:coffee_kst/app/screens/home/domain/usecase/get_product_type.dart';

part 'product_type_event.dart';
part 'product_type_state.dart';

class ProductTypeBloc extends Bloc<ProductTypeEvent, ProductTypeState> {
  GetProducTypeUseCase getProducTypeUseCase;
  ProductTypeBloc(
    this.getProducTypeUseCase,
  ) : super(const ProductTypeState()) {
    on<LoadTypeProductEvent>(_handleLoad);
  }
  _handleLoad(
      LoadTypeProductEvent event, Emitter<ProductTypeState> emit) async {
    emit(state.copyWith(state: LoadingState()));
    try {
      final result = await getProducTypeUseCase.call(NoParams());

      result.fold(
        (Failure left) {
          if (left is InternetFailure) {
            emit(state.copyWith(
                messageError: MESSAGE_NOT_INTERNET, state: LoadFailedState()));
          } else if (left is ServerFailure) {
            emit(state.copyWith(
                messageError: MESSAGE_SERVER_FAILURE,
                state: LoadFailedState()));
          }
        },
        (List<ProductTypeEntity> r) {
          emit(state.copyWith(list: r, state: LoadedState()));
        },
      );
    } catch (e) {
      emit(
          state.copyWith(messageError: e.toString(), state: LoadFailedState()));
    }
  }
}
