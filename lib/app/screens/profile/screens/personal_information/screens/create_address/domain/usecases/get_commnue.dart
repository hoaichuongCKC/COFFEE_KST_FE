// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/enitites/commune.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/repositories/address_repository.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';

class GetCommuneUsecase extends UseCase<List<CommuneEntity>, ParamsCommune> {
  final AddressRepository repository;
  GetCommuneUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<CommuneEntity>>> call(
      ParamsCommune params) async {
    return await repository.getCommune(params.idDistrict);
  }
}

class ParamsCommune extends Equatable {
  final String idDistrict;
  const ParamsCommune({
    required this.idDistrict,
  });
  @override
  List<Object?> get props => [idDistrict];
}
