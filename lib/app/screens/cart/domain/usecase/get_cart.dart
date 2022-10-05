// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_kst/app/screens/cart/domain/entities/cart.dart';
import 'package:coffee_kst/app/screens/cart/domain/repositories/invoice_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';

class GetCartUseCase extends UseCase<List<CartEntity>, NoParams> {
  final InvoiceRepository repository;
  GetCartUseCase({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<CartEntity>>> call(NoParams params) async {
    return await repository.getCart();
  }
}
