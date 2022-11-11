// ignore_for_file: must_be_immutable

import 'package:coffee_kst/app/screens/cart/domain/repositories/invoice_repository.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class PaymentUseCase extends UseCase<int, ParamPayment> {
  final InvoiceRepository repository;
  PaymentUseCase({
    required this.repository,
  });
  @override
  Future<Either<Failure, int>> call(ParamPayment params) async {
    return await repository.paymentInvoice(params);
  }
}

class ParamPayment extends Equatable {
  int id;
  int total;
  String shippingName;
  String shippingPhone;
  String shippingAddress;
  ParamPayment(
      {this.total = 0,
      this.id = 0,
      this.shippingName = '',
      this.shippingPhone = '',
      this.shippingAddress = ''});
  @override
  List<Object?> get props => [
        total,
        shippingName,
        id,
        shippingPhone,
        shippingAddress,
      ];
}
