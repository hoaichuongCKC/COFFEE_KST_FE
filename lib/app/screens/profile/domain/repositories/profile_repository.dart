import 'package:coffee_kst/app/screens/profile/domain/entities/user.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getInformationUser();
}
