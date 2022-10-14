part of 'cart_bloc.dart';

abstract class CartServiceEvent extends Equatable {
  const CartServiceEvent();

  @override
  List<Object> get props => [];
}

class LoadCartEvent extends CartServiceEvent {}

class AddToCartIsNotEmpty extends CartServiceEvent {}

class AddToCartEmpty extends CartServiceEvent {}
