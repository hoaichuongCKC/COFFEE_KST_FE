import 'package:coffee_kst/app/screens/profile/data/datasource/user_remote_datasource.dart';
import 'package:coffee_kst/app/screens/profile/domain/entities/user.dart';
import 'package:coffee_kst/app/screens/profile/domain/repositories/profile_repository.dart';
import 'package:coffee_kst/core/error/exception.dart';
import 'package:coffee_kst/core/network/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:coffee_kst/core/error/failures.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserEntity>> getInformationUser() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteLogin = await remoteDataSource.getInformationUser();
        return Right(remoteLogin);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }
}
