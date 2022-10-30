import 'package:coffee_kst/app/screens/cart/domain/repositories/invoice_repository.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class RemoveItemUseCase extends UseCase<int, ParamsRemoveItem> {
  final InvoiceRepository repository;
  RemoveItemUseCase({
    required this.repository,
  });
  @override
  Future<Either<Failure, int>> call(ParamsRemoveItem params) async {
    return await repository.removeItem(params);
  }
}

class ParamsRemoveItem extends Equatable {
  final int invoiceDetailId;
  final int productID;
  final String sizeName;
  const ParamsRemoveItem({
    required this.invoiceDetailId,
    required this.productID,
    required this.sizeName,
  });
  @override
  List<Object?> get props => [
        invoiceDetailId,
        productID,
        sizeName,
      ];
}
