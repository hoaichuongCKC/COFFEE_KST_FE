import 'dart:convert';
import 'package:coffee_kst/app/screens/login/data/models/login.dart';
import 'package:coffee_kst/core/api/api.dart';
import 'package:coffee_kst/core/endpoint/auth_controller.dart';

abstract class AuthLoginRemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<LoginModel> login(String phone, String password);
}

class AuthLoginRemoteDataSourceImpl
    with Api
    implements AuthLoginRemoteDataSource {
  AuthLoginRemoteDataSourceImpl();

  @override
  Future<LoginModel> login(String phone, String password) async {
    //params
    final data = jsonEncode(
      {
        "params": {
          "phone": phone,
          "password": password,
        }
      },
    );
    final response = await postService(ENDPOINT_LOGIN, data: data);
    return LoginModel.fromJson(
        jsonDecode(jsonEncode(response.data['results'])));
  }
}
