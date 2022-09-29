// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_kst/app/screens/home/domain/entities/voucher.dart';
import 'package:dartz/dartz.dart';

import 'package:coffee_kst/app/screens/home/domain/repositories/home_repository.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';

class GetListVoucherUseCase extends UseCase<List<VoucherEntity>, NoParams> {
  HomeRepository repository;
  GetListVoucherUseCase({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<VoucherEntity>>> call(NoParams params) async {
    return await repository.getListVoucher();
  }
}
