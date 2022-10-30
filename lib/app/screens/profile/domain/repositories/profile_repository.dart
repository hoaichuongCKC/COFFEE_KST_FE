import 'package:coffee_kst/app/screens/profile/domain/entities/user.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/models/app_model.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getInformationUser();
  Future<Either<Failure, AppEntity>> changePasswordUser(
      String oldPassowrd, String newPassword);
  Future<Either<Failure, UserEntity>> editInformationUser(
      String? phone, String? fullname, String? gender, String? address);
  Future<Either<Failure, UserEntity>> updateAvatar(String url);
}
