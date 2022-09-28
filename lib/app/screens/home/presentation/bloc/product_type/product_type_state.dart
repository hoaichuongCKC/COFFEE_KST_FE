// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_type_bloc.dart';

abstract class ProductTypeState extends Equatable {
  const ProductTypeState();

  @override
  List<Object> get props => [];
}

class InitialState extends ProductTypeState {}

class LoadingState extends ProductTypeState {}

class LoadedState extends ProductTypeState {
  final List<ProductTypeEntity> list;
  const LoadedState({
    required this.list,
  });
  @override
  List<Object> get props => [list];
}

class LoadFailedState extends ProductTypeState {
  final String messageError;
  const LoadFailedState({
    required this.messageError,
  });
  @override
  List<Object> get props => [messageError];
}
