part of 'cart_bloc.dart';

abstract class CartServiceEvent extends Equatable {
  const CartServiceEvent();

  @override
  List<Object> get props => [];
}

class InitCartEvent extends CartServiceEvent {}

class LoadCartEvent extends CartServiceEvent {}

class RemoveItemCartLocalEvent extends CartServiceEvent {
  final int invoiceDetailId;
  final int productID;
  final int index;
  final String sizeName;

  const RemoveItemCartLocalEvent(
      {required this.invoiceDetailId,
      required this.productID,
      required this.index,
      required this.sizeName});
  @override
  List<Object> get props => [index, invoiceDetailId, productID, sizeName];
}

class RemoveItemCartServerEvent extends CartServiceEvent {
  final int invoiceDetailId;
  final int productID;
  final String sizeName;

  const RemoveItemCartServerEvent(
      {required this.invoiceDetailId,
      required this.productID,
      required this.sizeName});
  @override
  List<Object> get props => [invoiceDetailId, productID, sizeName];
}

class UpdateTotalCartEvent extends CartServiceEvent {}

class IncrementToppingEvent extends CartServiceEvent {
  final int index;
  final int productIndex;

  const IncrementToppingEvent({
    required this.index,
    required this.productIndex,
  });
  @override
  List<Object> get props => [index, productIndex];
}

class DecrementToppingEvent extends CartServiceEvent {
  final int index;
  final int productIndex;

  const DecrementToppingEvent({
    required this.index,
    required this.productIndex,
  });
  @override
  List<Object> get props => [index, productIndex];
}

class IncrementProductEvent extends CartServiceEvent {
  final int productIndex;
  const IncrementProductEvent({required this.productIndex});
  @override
  List<Object> get props => [productIndex];
}

class DecrementProductEvent extends CartServiceEvent {
  final int productIndex;

  const DecrementProductEvent({required this.productIndex});
  @override
  List<Object> get props => [productIndex];
}
