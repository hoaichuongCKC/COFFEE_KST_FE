// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:coffee_kst/app/screens/login/domain/entities/login.dart';
import 'package:coffee_kst/app/screens/login/domain/repositories/auth_login_repository.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AuthLoginUsecases implements UseCase<LoginEntity, Params> {
  final AuthLoginRepository repository;

  AuthLoginUsecases(this.repository);

  @override
  Future<Either<Failure, LoginEntity>> call(Params params) async {
    return await repository.login(params.phone, params.password);
  }
}

class Params extends Equatable {
  final String phone;
  final String password;
  const Params({
    required this.phone,
    required this.password,
  });

  @override
  List<Object> get props => [phone, password];
}
