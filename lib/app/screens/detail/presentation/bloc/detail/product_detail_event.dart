// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

class InitEvent extends ProductDetailEvent {}

class LoadProductDetailEvent extends ProductDetailEvent {
  final int productID;
  const LoadProductDetailEvent({
    required this.productID,
  });
  @override
  List<Object> get props => [productID];
}
