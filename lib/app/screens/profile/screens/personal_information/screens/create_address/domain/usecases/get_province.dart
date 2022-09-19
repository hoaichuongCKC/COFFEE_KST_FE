import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/enitites/province.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/address_repository.dart';

class GetProvinceUseCase extends UseCase<ProvinceEntity, NoParams> {
  final AddressRepository repository;
  GetProvinceUseCase({required this.repository});
  @override
  Future<Either<Failure, ProvinceEntity>> call(NoParams params) async {
    return await repository.getProvince();
  }
}
