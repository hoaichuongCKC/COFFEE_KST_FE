import 'package:coffee_kst/app/screens/login/domain/entities/login.dart';
import 'package:coffee_kst/app/screens/login/domain/entities/login_otp.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthLoginRepository {
  Future<Either<Failure, LoginEntity>> login(String phone, String password);
  Future<Either<Failure, LoginOTPEntity>> loginOTP(String phone);
}
