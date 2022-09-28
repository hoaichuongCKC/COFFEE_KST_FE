// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_kst/app/screens/home/domain/entities/product_type.dart';
import 'package:dartz/dartz.dart';

import 'package:coffee_kst/app/screens/home/domain/repositories/home_repository.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';

class GetProducTypeUseCase extends UseCase<List<ProductTypeEntity>, NoParams> {
  HomeRepository repository;
  GetProducTypeUseCase({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<ProductTypeEntity>>> call(NoParams params) async {
    return await repository.getProductType();
  }
}
