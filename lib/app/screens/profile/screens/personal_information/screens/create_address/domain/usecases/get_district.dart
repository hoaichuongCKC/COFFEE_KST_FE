// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';
import 'package:equatable/equatable.dart';

import '../enitites/district.dart';
import '../repositories/address_repository.dart';

class GetDistrictUseCase extends UseCase<DistrictEntity, ParamsDistrict> {
  final AddressRepository repository;
  GetDistrictUseCase({required this.repository});
  @override
  Future<Either<Failure, DistrictEntity>> call(ParamsDistrict params) async {
    return await repository.getDistrict(params.idProvince);
  }
}

class ParamsDistrict extends Equatable {
  final int idProvince;
  const ParamsDistrict({
    required this.idProvince,
  });

  @override
  List<Object?> get props => [idProvince];
}
