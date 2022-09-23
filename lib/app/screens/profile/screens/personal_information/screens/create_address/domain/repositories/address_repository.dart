import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/enitites/commune.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/enitites/district.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/enitites/province.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AddressRepository {
  Future<Either<Failure, List<ProvinceEntity>>> getProvince();
  Future<Either<Failure, List<DistrictEntity>>> getDistrict(String idProvince);
  Future<Either<Failure, List<CommuneEntity>>> getCommune(String idDistrict);
}
