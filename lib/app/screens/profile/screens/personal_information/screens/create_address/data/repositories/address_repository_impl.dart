import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/enitites/province.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/enitites/district.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/enitites/commune.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/repositories/address_repository.dart';
import 'package:coffee_kst/core/network/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:coffee_kst/core/error/failures.dart';

import '../datasource/address_remote_datasource.dart';

class AddressRepositoryImpl extends AddressRepository {
  final AddressRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  AddressRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, ProvinceEntity>> getProvince() async {
    if (await networkInfo.isConnected) {
      final repository = await remoteDataSource.getProvince();
      return Right(repository);
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, CommuneEntity>> getCommune(int idDistrict) async {
    if (await networkInfo.isConnected) {
      final repository = await remoteDataSource.getCommune(idDistrict);
      return Right(repository);
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, DistrictEntity>> getDistrict(int idProvince) async {
    if (await networkInfo.isConnected) {
      final repository = await remoteDataSource.getDistrict(idProvince);
      return Right(repository);
    } else {
      return Left(InternetFailure());
    }
  }
}
