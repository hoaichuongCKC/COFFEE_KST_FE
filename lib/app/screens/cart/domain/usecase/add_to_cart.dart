import 'package:coffee_kst/app/screens/cart/domain/repositories/invoice_repository.dart';
import 'package:coffee_kst/app/screens/detail/presentation/bloc/detail_service/product_detail_bloc.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AddToCartEmptyUseCase extends UseCase<int, ParamAddToCartEmpty> {
  final InvoiceRepository repository;
  AddToCartEmptyUseCase({
    required this.repository,
  });
  @override
  Future<Either<Failure, int>> call(ParamAddToCartEmpty params) async {
    return await repository.addToCartEmpty(params);
  }
}

class ParamAddToCartEmpty extends Equatable {
  final String shippingAddress;
  final String shippingPhone;
  final String shippingName;
  final int total;
  final int quantity;
  final int productId;
  final String sizeName;
  final int price;
  final List<ToppingParams> listToppings;
  const ParamAddToCartEmpty({
    required this.shippingAddress,
    required this.shippingPhone,
    required this.shippingName,
    required this.total,
    required this.quantity,
    required this.productId,
    required this.sizeName,
    required this.price,
    required this.listToppings,
  });
  @override
  List<Object?> get props => [
        shippingAddress,
        shippingPhone,
        shippingName,
        total,
        quantity,
        productId,
        sizeName,
        price,
        listToppings,
        quantity,
      ];
}
