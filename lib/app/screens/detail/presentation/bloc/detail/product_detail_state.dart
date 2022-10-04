part of 'product_detail_bloc.dart';

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object> get props => [];
}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailLoaded extends ProductDetailState {
  final DetailEnity data;
  const ProductDetailLoaded({
    required this.data,
  });
  @override
  List<Object> get props => [data];
}

class ProductDetailLoadFailed extends ProductDetailState {
  final String message;
  const ProductDetailLoadFailed({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
