import 'dart:convert';

import 'package:coffee_kst/app/screens/profile/data/models/user.dart';
import 'package:coffee_kst/core/api/api.dart';
import 'package:coffee_kst/core/endpoint/user_controller.dart';
import 'package:coffee_kst/core/locale_keys.g.dart';
import 'package:coffee_kst/core/models/app_model.dart';
import 'package:coffee_kst/database/box/box_user.dart';
import 'package:dio/dio.dart';

abstract class UserRemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<UserModel> getInformationUser();
  Future<AppModel> changePasswordUser(String oldPassowrd, String newPassword);
  Future<UserModel> editInformationUser(
      String? phone, String? fullname, String? gender, String? address);
}

class UserRemoteDataSourceImpl with Api implements UserRemoteDataSource {
  UserRemoteDataSourceImpl();
  Future<Map<String, String>> setupHeader() async {
    String token = await BoxesUser.instance.getDataTokenUser();
    final Map<String, String> header = {
      'Authorization': "Bearer $token",
      'Accept': 'application/json',
    };
    return header;
  }

  @override
  Future<UserModel> getInformationUser() async {
    final response = await postService(
      ENDPOINT_GET_INFORMATION_USER,
      data: [],
      options: Options(headers: await setupHeader()),
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
      options: Options(headers: await setupHeader()),
    );
    return AppModel.fromJson(response.data['results']);
  }

  @override
  Future<UserModel> editInformationUser(
      String? phone, String? fullname, String? gender, String? address) async {
    int typeGender = 0; // anthoner
    if (gender == LocaleKeys.female_gender) {
      typeGender = 2;
    }
    if (gender == LocaleKeys.male_gender) {
      typeGender = 1;
    }
    final data = jsonEncode(
      {
        "params": {
          "phone": phone,
          "fullname": fullname,
          "gender": typeGender,
          "full_address": address,
        }
      },
    );
    final response = await postService(
      ENDPOINT_EDIT_INFORMATION_USER,
      data: data,
      options: Options(headers: await setupHeader()),
    );
    return UserModel.fromJson(response.data['results']['data']);
  }
}
