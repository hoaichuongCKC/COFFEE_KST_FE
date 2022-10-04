// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_kst/app/screens/detail/domain/entities/detail.dart';
import 'package:coffee_kst/app/screens/detail/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';

class GetDetailUseCase extends UseCase<DetailEnity, ParamDetail> {
  DetailRepository repository;
  GetDetailUseCase({
    required this.repository,
  });
  @override
  Future<Either<Failure, DetailEnity>> call(ParamDetail params) async {
    return await repository.getDetail(params.productID);
  }
}

class ParamDetail extends Equatable {
  final int productID;
  const ParamDetail({
    required this.productID,
  });
  @override
  List<Object?> get props => [productID];
}
