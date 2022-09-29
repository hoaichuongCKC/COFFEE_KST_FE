import 'package:coffee_kst/app/screens/home/data/datasource/home_remote_datasource.dart';
import 'package:coffee_kst/app/screens/home/domain/entities/product.dart';
import 'package:coffee_kst/app/screens/home/domain/entities/product_type.dart';
import 'package:coffee_kst/app/screens/home/domain/entities/voucher.dart';
import 'package:coffee_kst/app/screens/home/domain/repositories/home_repository.dart';
import 'package:coffee_kst/core/error/exception.dart';
import 'package:coffee_kst/core/network/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:coffee_kst/core/error/failures.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ProductTypeEntity>>> getProductType() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteLogin = await remoteDataSource.getProductType();
        return Right(remoteLogin);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, List<VoucherEntity>>> getListVoucher() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteLogin = await remoteDataSource.getListVoucher();
        return Right(remoteLogin);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getListProduct() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteLogin = await remoteDataSource.getListProduct();
        return Right(remoteLogin);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }
}
