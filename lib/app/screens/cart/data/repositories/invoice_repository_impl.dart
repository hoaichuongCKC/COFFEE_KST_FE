import 'package:coffee_kst/app/screens/cart/data/datasource/invoice_remote_datasource.dart';
import 'package:coffee_kst/app/screens/cart/domain/entities/cart.dart';
import 'package:coffee_kst/app/screens/cart/domain/repositories/invoice_repository.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/add_to_cart.dart';
import 'package:coffee_kst/core/error/exception.dart';
import 'package:coffee_kst/core/network/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:coffee_kst/core/error/failures.dart';

class InvoiceRepositoryImpl extends InvoiceRepository {
  final InvoiceRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  InvoiceRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<CartEntity>>> getCart() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getCart();
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, int>> addToCartEmpty(
      ParamAddToCartEmpty params) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.addToCartEmpty(params);
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }
}
