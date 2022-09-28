part of 'product_type_bloc.dart';

abstract class ProductTypeEvent extends Equatable {
  const ProductTypeEvent();

  @override
  List<Object> get props => [];
}

class LoadTypeProductEvent extends ProductTypeEvent {}
