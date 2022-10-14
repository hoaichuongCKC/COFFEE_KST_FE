// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

class CartServiceState extends Equatable {
  final String messageError;
  final List<CartEntity> list;
  final CartPageState state;
  const CartServiceState({
    this.messageError = '',
    this.list = const [],
    this.state = const CartInitial(),
  });

  @override
  List<Object> get props => [list, messageError, state];

  CartServiceState copyWith({
    String? messageError,
    List<CartEntity>? list,
    CartPageState? state,
  }) {
    return CartServiceState(
      messageError: messageError ?? this.messageError,
      list: list ?? this.list,
      state: state ?? this.state,
    );
  }
}

abstract class CartPageState {
  const CartPageState();
}

class CartInitial extends CartPageState {
  const CartInitial();
}

class CartLoading extends CartPageState {}

class CartDataEmpty extends CartPageState {}

class CartLoaded extends CartPageState {}

class CartLoadFailed extends CartPageState {}
