import 'dart:convert';
import 'package:coffee_kst/app/screens/detail/data/models/detail.dart';
import 'package:coffee_kst/core/api/api.dart';
import 'package:coffee_kst/core/endpoint/product_controller.dart';
import 'package:coffee_kst/database/box/box_user.dart';
import 'package:dio/dio.dart';

abstract class DetailRemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<DetailModel> getDetail(int productID);
}

class DetailRemoteDataSourceImpl with Api implements DetailRemoteDataSource {
  DetailRemoteDataSourceImpl();
  Future<Map<String, String>> setupHeader() async {
    String token = await BoxesUser.instance.getDataTokenUser();
    final Map<String, String> header = {
      'Authorization': "Bearer $token",
      'Accept': 'application/json',
    };
    return header;
  }

  @override
  Future<DetailModel> getDetail(int productID) async {
    final reponse = await postService(ENDPOINT_PRODUCT_DETAIL,
        data: jsonEncode({
          "params": {
            "product_id": productID,
          }
        }),
        options: Options(headers: await setupHeader()));
    return DetailModel.detailModelFromJson(
        jsonEncode(reponse.data['results']['data']));
  }
}
