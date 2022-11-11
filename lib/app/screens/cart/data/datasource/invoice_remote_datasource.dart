import 'dart:convert';
import 'package:coffee_kst/app/screens/cart/data/models/cart.dart';
import 'package:coffee_kst/app/screens/cart/data/models/info_receipt.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/add_to_cart.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/add_to_cart_is_not_empty.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/delete_order.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/payment.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/remove_cart.dart';
import 'package:coffee_kst/core/api/api.dart';
import 'package:coffee_kst/core/endpoint/invoice_controller.dart';
import 'package:coffee_kst/database/box/box_user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class InvoiceRemoteDataSource {
  Future<List<CartModel>> getCart();
  Future<int> addToCartEmpty(ParamAddToCartEmpty params);
  Future<int> removeITem(ParamsRemoveItem params);
  Future<int> addToCartIsNotEmpty(ParamAddToCartIsNotEmpty params);
  Future<int> paymentInvoice(ParamPayment params);
  Future<int> deleteOrder(ParamsDeleteOrder params);
  Future<List<InvoiceModels>> getNewOrder();
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

  @override
  Future<int> removeITem(ParamsRemoveItem params) async {
    final data = {
      "params": {
        "invoice_detail_id": params.invoiceDetailId,
        "product_id": params.productID,
        "size_name": params.sizeName
      },
    };
    final header = await setupHeader();
    final code = await compute(isolateRemoveItem, [data, header]);
    return code;
  }

  //new isolate remove-item
  isolateRemoveItem(List params) async {
    final reponse = await postService(ENDPOINT_DELETE_ITEM_CART,
        data: jsonEncode(params[0]), options: Options(headers: params[1]));
    return reponse.statusCode!;
  }

  @override
  Future<int> addToCartIsNotEmpty(ParamAddToCartIsNotEmpty params) async {
    final data = {
      "params": {
        "product_id": params.productId,
        "quantity": params.quantity,
        "size_name": params.sizeName,
        "price": params.price,
        "list_topping": List<dynamic>.from(
            params.listToppings.map((element) => element.toJson()))
      },
    };
    final header = await setupHeader();
    final code = await compute(isolateAddToCartIsNotEmpty, [data, header]);
    return code;
  }

  Future<int> isolateAddToCartIsNotEmpty(List param) async {
    final reponse = await postService(ENDPOINT_ADD_TO_CART_IS_NOT_EMPTY,
        data: jsonEncode(param[0]), options: Options(headers: param[1]));
    return reponse.statusCode!;
  }

  @override
  Future<int> paymentInvoice(ParamPayment params) async {
    final data = {
      "params": {
        'id': params.id,
        "shipping_address": params.shippingAddress,
        "shipping_name": params.shippingName,
        "shipping_phone": params.shippingPhone,
        "total": params.total,
      },
    };
    final header = await setupHeader();
    final code = await compute(isolatePayment, [data, header]);
    return code;
  }

  Future<int> isolatePayment(List<dynamic> param) async {
    final reponse = await postService(ENDPOINT_PAYMENT,
        data: jsonEncode(param[0]), options: Options(headers: param[1]));
    return reponse.statusCode!;
  }

  @override
  Future<List<InvoiceModels>> getNewOrder() async {
    final header = await setupHeader();
    final data = await compute(isolateGetNewOrder, header);
    return InvoiceModels.invoiceEntityFromJson(jsonEncode(data));
  }

  Future isolateGetNewOrder(Map<String, String> param) async {
    final reponse = await postService(ENDPOINT_GET_NEW_ORDER,
        data: jsonEncode([]), options: Options(headers: param));
    return reponse.data['results']['data'];
  }

  @override
  Future<int> deleteOrder(ParamsDeleteOrder params) async {
    final header = await setupHeader();
    final data = {
      "params": {
        "invoice_id": params.invoiceId,
        "invoice_detail_id": params.invoiceDetailId
      },
    };
    final code = await compute(isolateDeleteOrder, [header, data]);
    return code;
  }

  Future isolateDeleteOrder(List param) async {
    final reponse = await postService(ENDPOINT_DELETE_ORDER,
        data: jsonEncode(param[1]), options: Options(headers: param[0]));
    return reponse.statusCode;
  }
}
