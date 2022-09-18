// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:coffee_kst/app/screens/login/domain/entities/login_otp.dart';
import 'package:coffee_kst/app/screens/login/domain/repositories/auth_login_repository.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AuthOTPUsecases implements UseCase<LoginOTPEntity, ParamsOTP> {
  final AuthLoginRepository repository;

  AuthOTPUsecases(this.repository);

  @override
  Future<Either<Failure, LoginOTPEntity>> call(ParamsOTP params) async {
    return await repository.loginOTP(params.phone);
  }
}

class ParamsOTP extends Equatable {
  final String phone;
  const ParamsOTP({
    required this.phone,
  });

  @override
  List<Object> get props => [phone];
}
