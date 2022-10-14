import 'package:coffee_kst/app/screens/detail/data/datasource/detail_remote_datasource.dart';
import 'package:coffee_kst/app/screens/detail/domain/entities/detail.dart';
import 'package:coffee_kst/app/screens/detail/domain/repositories/home_repository.dart';
import 'package:coffee_kst/core/error/exception.dart';
import 'package:coffee_kst/core/network/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:coffee_kst/core/error/failures.dart';

class DetailRepositoryImpl implements DetailRepository {
  final DetailRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  DetailRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, DetailEntity>> getDetail(int productID) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteLogin = await remoteDataSource.getDetail(productID);
        return Right(remoteLogin);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }
}
