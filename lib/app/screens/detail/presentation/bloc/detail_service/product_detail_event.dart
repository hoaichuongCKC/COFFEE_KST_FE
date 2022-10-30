// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_detail_bloc.dart';

abstract class ProductDetailServiceEvent extends Equatable {
  const ProductDetailServiceEvent();

  @override
  List<Object> get props => [];
}

class ResetEvent extends ProductDetailServiceEvent {}

class LoadProductDetailEvent extends ProductDetailServiceEvent {
  final int productID;
  const LoadProductDetailEvent({
    required this.productID,
  });
  @override
  List<Object> get props => [productID];
}

class AddToCartEvent extends ProductDetailServiceEvent {}

class AddToCartIsNotEmptyEvent extends ProductDetailServiceEvent {}

class InitDetailEvent extends ProductDetailServiceEvent {
  final String sizeName;
  final int total;
  final int productID;
  final int defaultPrice;
  const InitDetailEvent({
    required this.sizeName,
    required this.total,
    required this.defaultPrice,
    required this.productID,
  });
  @override
  List<Object> get props => [sizeName, total, defaultPrice, productID];
}

class IncrementQuantityProductEvent extends ProductDetailServiceEvent {}

class DecrementQuantityProductEvent extends ProductDetailServiceEvent {}

class ChooseSizeEvent extends ProductDetailServiceEvent {
  final String size;
  const ChooseSizeEvent({
    required this.size,
  });
  @override
  List<Object> get props => [size];
}

class AddElementToppingEvent extends ProductDetailServiceEvent {
  final ToppingParams toppingParams;

  const AddElementToppingEvent({required this.toppingParams});
  @override
  List<Object> get props => [toppingParams];
}

class RemoveElementToppingEvent extends ProductDetailServiceEvent {
  final int toppingId;

  const RemoveElementToppingEvent({required this.toppingId});
  @override
  List<Object> get props => [toppingId];
}

class UpdateTotalEvent extends ProductDetailServiceEvent {}
