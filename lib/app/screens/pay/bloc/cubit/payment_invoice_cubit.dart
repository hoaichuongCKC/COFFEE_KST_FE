// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/payment.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/utils/constants.dart';
import 'package:coffee_kst/core/utils/constants_login.dart';
import 'package:coffee_kst/database/box/information_user.dart';
import 'package:equatable/equatable.dart';

part 'payment_invoice_state.dart';

class PaymentInvoiceCubit extends Cubit<PaymentInvoiceState> {
  final PaymentUseCase paymentUseCase;
  PaymentInvoiceCubit(this.paymentUseCase) : super(const PaymentInvoiceState());

  void onPaymentInvoice(int total, int invoiceID) async {
    final box = await BoxesInformationUser.instance.getInformationUser();
    final paramPayment = ParamPayment(
      shippingAddress: box!.full_address,
      shippingName: box.fullname,
      shippingPhone: box.phone,
      id: invoiceID,
      total: total,
    );
    emit(state.copyWith(state: PaymentInvoiceLoading()));
    try {
      final reuslt = await paymentUseCase.call(paramPayment);
      reuslt.fold(
        (Failure failure) {
          if (failure is InternetFailure) {
            emit(state.copyWith(
                error: MESSAGE_NOT_INTERNET, state: PaymentInvoiceFailed()));
          } else if (failure is ServerFailure) {
            emit(state.copyWith(
                error: MESSAGE_SERVER_FAILURE, state: PaymentInvoiceFailed()));
          }
        },
        (int code) {
          if (code == SUCCESS_CODE) {
            emit(state.copyWith(state: PaymentInvoiceSuccess()));
          } else if (code == FAILED_CODE) {
            emit(state.copyWith(
                error: 'Lỗi ở server', state: PaymentInvoiceFailed()));
          }
        },
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString(), state: PaymentInvoiceFailed()));
    }
  }
}
