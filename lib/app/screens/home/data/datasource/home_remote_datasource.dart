import 'dart:convert';

import 'package:coffee_kst/app/screens/home/data/models/product_type.dart';
import 'package:coffee_kst/core/api/api.dart';
import 'package:coffee_kst/core/endpoint/product_controller.dart';
import 'package:coffee_kst/database/box/box_user.dart';
import 'package:dio/dio.dart';

abstract class HomeRemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<List<ProductTypeModel>> getProductType();
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
}
