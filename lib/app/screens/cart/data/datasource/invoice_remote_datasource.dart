import 'dart:convert';

import 'package:coffee_kst/app/screens/cart/data/models/cart.dart';
import 'package:coffee_kst/core/api/api.dart';
import 'package:coffee_kst/core/endpoint/invoice_controller.dart';
import 'package:coffee_kst/database/box/box_user.dart';
import 'package:dio/dio.dart';

abstract class InvoiceRemoteDataSource {
  Future<List<CartModel>> getCart();
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
}
