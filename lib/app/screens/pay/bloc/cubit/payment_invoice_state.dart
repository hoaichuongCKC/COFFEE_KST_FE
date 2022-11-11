// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'payment_invoice_cubit.dart';

class PaymentInvoiceState extends Equatable {
  final PaymentState state;
  final String error;
  const PaymentInvoiceState({
    this.state = const PaymentInvoiceInitial(),
    this.error = '',
  });

  @override
  List<Object> get props => [state, error];

  PaymentInvoiceState copyWith({
    PaymentState? state,
    String? error,
  }) {
    return PaymentInvoiceState(
      state: state ?? this.state,
      error: error ?? this.error,
    );
  }
}

abstract class PaymentState {
  const PaymentState();
}

class PaymentInvoiceInitial extends PaymentState {
  const PaymentInvoiceInitial();
}

class PaymentInvoiceSuccess extends PaymentState {}

class PaymentInvoiceFailed extends PaymentState {}

class PaymentInvoiceLoading extends PaymentState {}
