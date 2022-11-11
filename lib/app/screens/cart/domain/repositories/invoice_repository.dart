import 'package:coffee_kst/app/screens/cart/data/models/info_receipt.dart';
import 'package:coffee_kst/app/screens/cart/domain/entities/cart.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/add_to_cart.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/add_to_cart_is_not_empty.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/delete_order.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/payment.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/remove_cart.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class InvoiceRepository {
  Future<Either<Failure, List<CartEntity>>> getCart();
  Future<Either<Failure, int>> addToCartEmpty(ParamAddToCartEmpty params);
  Future<Either<Failure, int>> removeItem(ParamsRemoveItem params);
  Future<Either<Failure, int>> addToCartIsNotEmpty(
      ParamAddToCartIsNotEmpty params);
  Future<Either<Failure, int>> paymentInvoice(ParamPayment params);
  Future<Either<Failure, int>> deleteOrder(ParamsDeleteOrder params);
  Future<Either<Failure, List<InvoiceModels>>> getNewOrder();
}
