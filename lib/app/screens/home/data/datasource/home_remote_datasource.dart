import 'dart:convert';

import 'package:coffee_kst/app/screens/home/data/models/product.dart';
import 'package:coffee_kst/app/screens/home/data/models/product_type.dart';
import 'package:coffee_kst/app/screens/home/data/models/voucher.dart';
import 'package:coffee_kst/core/api/api.dart';
import 'package:coffee_kst/core/endpoint/product_controller.dart';
import 'package:coffee_kst/core/endpoint/voucher_controller.dart';
import 'package:coffee_kst/database/box/box_user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class HomeRemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<List<ProductTypeModel>> getProductType();
  Future<List<VoucherModel>> getListVoucher();
  Future<List<ProductModel>> getListProduct();
  Future<List<ProductModel>> getBestSeller();
}

class HomeRemoteDataSourceImpl with Api implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl();
  Future<Map<String, String>> setupHeader() async {
    String token = await BoxesUser.instance.getDataTokenUser();
    final Map<String, String> header = {
      'Authorization': "Bearer $token",
      'Accept': 'application/json',
    };
    return header;
  }

  @override
  Future<List<ProductTypeModel>> getProductType() async {
    final reponse = await postService(ENDPOINT_PRODUCT_TYPE,
        data: jsonEncode({}), options: Options(headers: await setupHeader()));
    return productTypeModelFromJson(
        jsonEncode(reponse.data['results']['data']));
  }

  @override
  Future<List<VoucherModel>> getListVoucher() async {
    final reponse = await postService(ENDPOINT_LIST_VOUCHER,
        data: jsonEncode({}), options: Options(headers: await setupHeader()));
    return VoucherModel.voucherModelFromJson(
        jsonEncode(reponse.data['results']['data']));
  }

  @override
  Future<List<ProductModel>> getListProduct() async {
    final reponse = await postService(ENDPOINT_PRODUCT_LIST,
        data: jsonEncode({}), options: Options(headers: await setupHeader()));
    return ProductModel.productEnityFromJson(
        jsonEncode(reponse.data['results']['data']));
  }

  @override
  Future<List<ProductModel>> getBestSeller() async {
    final header = await setupHeader();
    final result = await compute(isolateGetBestSeller, [header]);
    return ProductModel.productEnityFromJson(jsonEncode(result));
  }

  isolateGetBestSeller(List params) async {
    final reponse = await postService(ENDPOINT_BEST_SELLER,
        data: jsonEncode({}), options: Options(headers: params[0]));
    return reponse.data['results'];
  }
}
