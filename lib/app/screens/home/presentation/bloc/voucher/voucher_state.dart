// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'voucher_bloc.dart';

abstract class VoucherHomeState extends Equatable {
  const VoucherHomeState();

  @override
  List<Object> get props => [];
}

class VoucherInitial extends VoucherHomeState {}

class VoucherLoading extends VoucherHomeState {}

class VoucherLoaded extends VoucherHomeState {
  final List<VoucherEntity> list;
  const VoucherLoaded({
    required this.list,
  });
  @override
  List<Object> get props => [list];
}

class VoucherLoadFailed extends VoucherHomeState {
  final String message;
  const VoucherLoadFailed({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
