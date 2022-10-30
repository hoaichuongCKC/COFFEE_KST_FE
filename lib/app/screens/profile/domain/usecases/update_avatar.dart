// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_kst/app/screens/profile/domain/entities/user.dart';
import 'package:coffee_kst/app/screens/profile/domain/repositories/profile_repository.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class UpdateAvatarUsecases implements UseCase<UserEntity, String> {
  final UserRepository repository;

  UpdateAvatarUsecases(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(String params) async {
    return await repository.updateAvatar(params);
  }
}
