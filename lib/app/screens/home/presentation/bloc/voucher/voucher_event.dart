part of 'voucher_bloc.dart';

abstract class VoucherHomeEvent extends Equatable {
  const VoucherHomeEvent();

  @override
  List<Object> get props => [];
}

class LoadVoucherEvent extends VoucherHomeEvent {}
