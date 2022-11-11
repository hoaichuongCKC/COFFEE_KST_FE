// ignore_for_file: must_be_immutable

import 'package:coffee_kst/app/screens/cart/data/models/info_receipt.dart';
import 'package:coffee_kst/app/screens/cart/domain/repositories/invoice_repository.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetNewOrderUseCase extends UseCase<List<InvoiceModels>, NoParams> {
  final InvoiceRepository repository;
  GetNewOrderUseCase({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<InvoiceModels>>> call(NoParams params) async {
    return await repository.getNewOrder();
  }
}
