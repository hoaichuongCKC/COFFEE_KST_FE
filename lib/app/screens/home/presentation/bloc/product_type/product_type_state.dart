// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_type_bloc.dart';

class ProductTypeState extends Equatable {
  final List<ProductTypeEntity> list;
  final String messageError;
  final TypeServiceState state;
  const ProductTypeState({
    this.list = const [],
    this.messageError = '',
    this.state = const InitialState(),
  });

  @override
  List<Object> get props => [list, state, messageError];

  ProductTypeState copyWith({
    List<ProductTypeEntity>? list,
    String? messageError,
    TypeServiceState? state,
  }) {
    return ProductTypeState(
      list: list ?? this.list,
      messageError: messageError ?? this.messageError,
      state: state ?? this.state,
    );
  }
}

abstract class TypeServiceState {
  const TypeServiceState();
}

class InitialState extends TypeServiceState {
  const InitialState();
}

class LoadingState extends TypeServiceState {}

class LoadedState extends TypeServiceState {}

class LoadFailedState extends TypeServiceState {}
