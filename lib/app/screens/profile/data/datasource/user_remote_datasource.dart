import 'dart:convert';

import 'package:coffee_kst/app/screens/profile/data/models/user.dart';
import 'package:coffee_kst/core/api/api.dart';
import 'package:coffee_kst/core/endpoint/user_controller.dart';
import 'package:coffee_kst/core/models/app_model.dart';
import 'package:dio/dio.dart';

String token = "7|NqVc5yxEAvb0BC2I4BOqywhx9vWDrGJauRpMEg2X";
final Map<String, String> header = {
  'Authorization': "Bearer $token",
  'Accept': 'application/json',
};

abstract class UserRemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<UserModel> getInformationUser();
  Future<AppModel> changePasswordUser(String oldPassowrd, String newPassword);
}

class UserRemoteDataSourceImpl with Api implements UserRemoteDataSource {
  UserRemoteDataSourceImpl();

  @override
  Future<UserModel> getInformationUser() async {
    final response = await postService(
      ENDPOINT_GET_INFORMATION_USER,
      data: [],
      options: Options(headers: header),
    );
    return UserModel.fromJson(response.data['results']);
  }

  @override
  Future<AppModel> changePasswordUser(
      String oldPassowrd, String newPassword) async {
    final data = jsonEncode(
      {
        "params": {
          "old_password": oldPassowrd,
          "new_password": newPassword,
        }
      },
    );
    final response = await postService(
      ENDPOINT_CHANGE_PASSWORD,
      data: data,
      options: Options(headers: header),
    );
    print(response.data);
    return AppModel.fromJson(response.data['results']);
  }
}
