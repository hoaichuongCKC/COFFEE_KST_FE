// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'my_invoice_cubit.dart';

@immutable
class MyInvoiceState extends Equatable {
  final StateLoadApi stateApi;
  final List<InvoiceModels> listNewOrder;
  final List<InvoiceModels> listConfirmed;
  final List<InvoiceModels> listDelivering;
  final List<InvoiceModels> listSuccessful;
  final List<InvoiceModels> listCancled;
  final String messageError;
  const MyInvoiceState({
    this.stateApi = const InitialState(),
    this.listNewOrder = const [],
    this.listCancled = const [],
    this.listConfirmed = const [],
    this.listDelivering = const [],
    this.listSuccessful = const [],
    this.messageError = '',
  });

  @override
  List<Object?> get props => [
        stateApi,
        listNewOrder,
        messageError,
        listConfirmed,
        listDelivering,
        listSuccessful,
        listCancled,
      ];

  MyInvoiceState copyWith({
    StateLoadApi? stateApi,
    List<InvoiceModels>? listNewOrder,
    List<InvoiceModels>? listConfirmed,
    List<InvoiceModels>? listDelivering,
    List<InvoiceModels>? listSuccessful,
    List<InvoiceModels>? listCancled,
    String? messageError,
  }) {
    return MyInvoiceState(
      stateApi: stateApi ?? this.stateApi,
      listNewOrder: listNewOrder ?? this.listNewOrder,
      listConfirmed: listConfirmed ?? this.listConfirmed,
      listDelivering: listDelivering ?? this.listDelivering,
      listSuccessful: listSuccessful ?? this.listSuccessful,
      listCancled: listCancled ?? this.listCancled,
      messageError: messageError ?? this.messageError,
    );
  }
}

abstract class StateLoadApi {
  const StateLoadApi();
}

class InitialState extends StateLoadApi {
  const InitialState();
}

class LoadingState extends StateLoadApi {}

class SuccessState extends StateLoadApi {}

class FailedState extends StateLoadApi {}

class EmptyState extends StateLoadApi {}
