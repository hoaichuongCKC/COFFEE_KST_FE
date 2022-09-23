// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:coffee_kst/app/screens/profile/domain/entities/user.dart';
import 'package:coffee_kst/app/screens/profile/domain/repositories/profile_repository.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';

class EditInformationUserUsecases
    implements UseCase<UserEntity, ParamsEditInformation> {
  final UserRepository repository;

  EditInformationUserUsecases(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(ParamsEditInformation params) async {
    return await repository.editInformationUser(
        params.phone, params.fullname, params.gender, params.address);
  }
}

class ParamsEditInformation extends Equatable {
  final String fullname;
  final String phone;
  final String gender;
  final String address;
  const ParamsEditInformation({
    required this.fullname,
    required this.phone,
    required this.gender,
    required this.address,
  });

  @override
  List<Object?> get props => [phone, fullname, address, gender];
}
