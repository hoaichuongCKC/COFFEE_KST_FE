// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:coffee_kst/app/screens/profile/domain/repositories/profile_repository.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/models/app_model.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';

class ChangePasswordUserUsecases
    implements UseCase<AppEntity, ParamsChangePassword> {
  final UserRepository repository;

  ChangePasswordUserUsecases(this.repository);

  @override
  Future<Either<Failure, AppEntity>> call(ParamsChangePassword params) async {
    return await repository.changePasswordUser(
        params.old_password, params.new_password);
  }
}

class ParamsChangePassword extends Equatable {
  final String old_password;
  final String new_password;
  const ParamsChangePassword({
    required this.old_password,
    required this.new_password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [old_password, new_password];
}
