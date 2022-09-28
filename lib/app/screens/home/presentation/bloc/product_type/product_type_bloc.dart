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
  ) : super(InitialState()) {
    on<LoadTypeProductEvent>(_handleLoad);
  }
  _handleLoad(
      LoadTypeProductEvent event, Emitter<ProductTypeState> emit) async {
    print(1);
    emit(LoadingState());
    try {
      final result = await getProducTypeUseCase.call(NoParams());

      result.fold(
        (Failure l) {
          if (result is InternetFailure) {
            emit(const LoadFailedState(messageError: MESSAGE_NOT_INTERNET));
          } else if (result is ServerFailure) {
            emit(const LoadFailedState(messageError: MESSAGE_SERVER_FAILURE));
          }
        },
        (List<ProductTypeEntity> r) {
          emit(LoadedState(list: r));
        },
      );
    } catch (e) {
      emit(LoadFailedState(messageError: e.toString()));
    }
  }
}
