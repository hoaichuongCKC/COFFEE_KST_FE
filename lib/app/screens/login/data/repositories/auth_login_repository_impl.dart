// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_kst/core/error/exception.dart';
import 'package:coffee_kst/core/network/network_info.dart';
import 'package:dartz/dartz.dart';

import 'package:coffee_kst/app/screens/login/data/datasource/auth_login_remote_datasource.dart';
import 'package:coffee_kst/app/screens/login/domain/entities/login.dart';
import 'package:coffee_kst/app/screens/login/domain/repositories/auth_login_repository.dart';
import 'package:coffee_kst/core/error/failures.dart';

class AuthLoginRepositoryImpl implements AuthLoginRepository {
  final AuthLoginRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  AuthLoginRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, LoginEntity>> login(
      String phone, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteLogin = await remoteDataSource.login(phone, password);
        return Right(remoteLogin);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }
}
