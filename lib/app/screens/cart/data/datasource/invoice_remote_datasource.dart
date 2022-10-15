import 'dart:convert';
import 'package:coffee_kst/app/screens/cart/data/models/cart.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/add_to_cart.dart';
import 'package:coffee_kst/core/api/api.dart';
import 'package:coffee_kst/core/endpoint/invoice_controller.dart';
import 'package:coffee_kst/database/box/box_user.dart';
import 'package:dio/dio.dart';

abstract class InvoiceRemoteDataSource {
  Future<List<CartModel>> getCart();
  Future<int> addToCartEmpty(ParamAddToCartEmpty params);
}

class InvoiceRemoteDataSourceImpl extends InvoiceRemoteDataSource with Api {
  Future<Map<String, String>> setupHeader() async {
    String token = await BoxesUser.instance.getDataTokenUser();
    final Map<String, String> header = {
      'Authorization': "Bearer $token",
      'Accept': 'application/json',
    };
    return header;
  }

  @override
  Future<List<CartModel>> getCart() async {
    final reponse = await postService(ENDPOINT_LIST_CART,
        data: jsonEncode({}), options: Options(headers: await setupHeader()));
    return CartModel.cartModelFromJson(
        jsonEncode(reponse.data['results']['data']));
  }

  @override
  Future<int> addToCartEmpty(ParamAddToCartEmpty params) async {
    final data = {
      "params": {
        "shipping_address": params.shippingAddress,
        "shipping_phone": params.shippingPhone,
        "shipping_name": params.shippingName,
        "total": params.total,
        "product_id": params.productId,
        "quantity": params.quantity,
        "size_name": params.sizeName,
        "price": params.price,
        "list_topping": List<dynamic>.from(
            params.listToppings.map((element) => element.toJson()))
      },
    };
    final reponse = await postService(ENDPOINT_ADD_TO_CAR_EMPTY,
        data: jsonEncode(data), options: Options(headers: await setupHeader()));
    return reponse.statusCode!;
  }
}
