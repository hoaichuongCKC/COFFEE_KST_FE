import 'package:coffee_kst/app/screens/cart/domain/repositories/invoice_repository.dart';
import 'package:coffee_kst/app/screens/detail/presentation/bloc/detail_service/product_detail_bloc.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AddToCartIsNotEmptyUseCase
    extends UseCase<int, ParamAddToCartIsNotEmpty> {
  final InvoiceRepository repository;
  AddToCartIsNotEmptyUseCase({
    required this.repository,
  });
  @override
  Future<Either<Failure, int>> call(ParamAddToCartIsNotEmpty params) async {
    return await repository.addToCartIsNotEmpty(params);
  }
}

class ParamAddToCartIsNotEmpty extends Equatable {
  final int quantity;
  final int productId;
  final String sizeName;
  final int price;
  final List<ToppingParams> listToppings;
  const ParamAddToCartIsNotEmpty({
    required this.quantity,
    required this.productId,
    required this.sizeName,
    required this.price,
    required this.listToppings,
  });
  @override
  List<Object?> get props => [
        quantity,
        productId,
        sizeName,
        price,
        listToppings,
        quantity,
      ];
}
