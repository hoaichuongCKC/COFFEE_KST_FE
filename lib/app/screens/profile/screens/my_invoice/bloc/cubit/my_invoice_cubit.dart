// ignore_for_file: public_member_api_docs, sort_constructors_first, empty_catches
// ignore_for_file: depend_on_referenced_packages
import 'package:coffee_kst/app/screens/cart/data/models/info_receipt.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/delete_order.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/get_new_order.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:equatable/equatable.dart';

part 'my_invoice_state.dart';

class MyInvoiceCubit extends Cubit<MyInvoiceState> {
  final GetNewOrderUseCase getNewOrderUseCase;
  final DeleteOrderUseCase deleteOrderUseCase;
  MyInvoiceCubit(
    this.getNewOrderUseCase,
    this.deleteOrderUseCase,
  ) : super(const MyInvoiceState());

  void getAllOrder() async {
    emit(state.copyWith(stateApi: LoadingState()));
    try {
      final result = await getNewOrderUseCase.call(NoParams());
      result.fold(
        (Failure result) {
          if (result is InternetFailure) {
            emit(state.copyWith(
                messageError: MESSAGE_NOT_INTERNET, stateApi: FailedState()));
          } else if (result is ServerFailure) {
            emit(state.copyWith(
                messageError: MESSAGE_SERVER_FAILURE, stateApi: FailedState()));
          }
        },
        (List<InvoiceModels> data) {
          if (data.isEmpty) {
            emit(state.copyWith(listNewOrder: [], stateApi: EmptyState()));
          } else {
            for (var element in data) {
              if (element.status == 1) {
                emit(state.copyWith(
                  listNewOrder: List.from(state.listNewOrder)..add(element),
                  stateApi: SuccessState(),
                ));
              } else if (element.status == 2) {
                emit(state.copyWith(
                  listConfirmed: List.from(state.listConfirmed)..add(element),
                  stateApi: SuccessState(),
                ));
              } else if (element.status == 3) {
                emit(state.copyWith(
                  listDelivering: List.from(state.listDelivering)..add(element),
                  stateApi: SuccessState(),
                ));
              } else if (element.status == 4) {
                emit(state.copyWith(
                  listSuccessful: List.from(state.listSuccessful)..add(element),
                  stateApi: SuccessState(),
                ));
              } else if (element.status == -1) {
                emit(state.copyWith(
                  listCancled: List.from(state.listCancled)..add(element),
                  stateApi: SuccessState(),
                ));
              }
            }
          }
        },
      );
    } catch (e) {
      emit(state.copyWith(messageError: e.toString(), stateApi: FailedState()));
    }
  }

  void deleteItemOrder(
      int invoiceId, List<int> invoiceDetailId, int index) async {
    try {
      final result = await deleteOrderUseCase.call(ParamsDeleteOrder(
          invoiceId: invoiceId, invoiceDetailId: invoiceDetailId));
      result.fold(
        (Failure result) {
          if (result is InternetFailure) {
            emit(state.copyWith(
                messageError: MESSAGE_NOT_INTERNET, stateApi: FailedState()));
          } else if (result is ServerFailure) {
            emit(state.copyWith(
                messageError: MESSAGE_SERVER_FAILURE, stateApi: FailedState()));
          }
        },
        (int code) {
          deleteItemNewOrderLocal(invoiceId, index);
        },
      );
    } catch (e) {}
  }

  void deleteItemNewOrderLocal(int invoiceId, int index) {
    final state = this.state;
    (state.listNewOrder).removeAt(index);
    emit(state.copyWith(
        listNewOrder: state.listNewOrder, stateApi: SuccessState()));
  }
}
