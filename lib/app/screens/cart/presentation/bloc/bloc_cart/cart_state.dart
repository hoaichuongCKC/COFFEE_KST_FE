// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

abstract class CartServiceState extends Equatable {
  const CartServiceState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartServiceState {}

class CartLoading extends CartServiceState {}

class CartDataEmpty extends CartServiceState {}

class CartLoaded extends CartServiceState {
  final List<CartEntity> list;
  const CartLoaded({
    required this.list,
  });
  @override
  List<Object> get props => [list];
}

class CartLoadFailed extends CartServiceState {
  final String messageError;
  const CartLoadFailed({
    required this.messageError,
  });
  @override
  List<Object> get props => [messageError];
}
