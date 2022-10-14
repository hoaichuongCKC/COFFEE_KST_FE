import 'package:coffee_kst/app/screens/detail/domain/entities/detail.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class DetailRepository {
  Future<Either<Failure, DetailEntity>> getDetail(int productID);
}
