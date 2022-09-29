part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductEntity> list;
  const ProductLoaded({
    required this.list,
  });
  @override
  List<Object> get props => [list];
}

class ProductLoadFailed extends ProductState {
  final String messageError;
  const ProductLoadFailed({
    required this.messageError,
  });
  @override
  List<Object> get props => [messageError];
}
