// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:coffee_kst/app/screens/cart/domain/repositories/invoice_repository.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';

class DeleteOrderUseCase extends UseCase<int, ParamsDeleteOrder> {
  final InvoiceRepository repository;
  DeleteOrderUseCase({
    required this.repository,
  });
  @override
  Future<Either<Failure, int>> call(ParamsDeleteOrder params) async {
    return await repository.deleteOrder(params);
  }
}

class ParamsDeleteOrder extends Equatable {
  final int invoiceId;
  final List<int> invoiceDetailId;
  const ParamsDeleteOrder({
    required this.invoiceId,
    required this.invoiceDetailId,
  });
  @override
  List<Object?> get props => [invoiceDetailId, invoiceId];
}
