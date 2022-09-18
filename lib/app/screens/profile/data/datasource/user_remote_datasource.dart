import 'package:coffee_kst/app/screens/profile/data/models/user.dart';
import 'package:coffee_kst/core/api/api.dart';
import 'package:coffee_kst/core/endpoint/user_controller.dart';
import 'package:dio/dio.dart';

abstract class UserRemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<UserModel> getInformationUser();
}

class UserRemoteDataSourceImpl with Api implements UserRemoteDataSource {
  UserRemoteDataSourceImpl();

  @override
  Future<UserModel> getInformationUser() async {
    String token = "3|RypGnsZTwksDMTEDHyS57xxBLEqc4CmBdVXdqusc";
    final Map<String, String> header = {
      'Authorization': "Bearer $token",
      'Accept': 'application/json',
    };
    final response = await postService(
      ENDPOINT_GET_INFORMATION_USER,
      data: [],
      options: Options(headers: header),
    );
    return UserModel.fromJson(response.data['results']);
  }
}
