import 'package:coffee_kst/app/screens/login/domain/entities/login.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    required super.code,
    required super.validateToken,
    required super.message,
    required super.data,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    if (json['data'].runtimeType == List<dynamic>) {
      return LoginModel(
        code: json["code"],
        message: json["message"],
        validateToken: json["validate_token"],
        data: null,
      );
    } else {
      return LoginModel(
        code: json["code"],
        message: json["message"],
        validateToken: json["validate_token"],
        data: DataModel.fromJson(json["data"]),
      );
    }
  }
  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "validate_token": validateToken,
        "data": data,
      };
  @override
  String toString() => toJson().toString();
}

class DataModel extends DataEntity {
  const DataModel({
    required super.token,
    required super.refreshToken,
  });
  factory DataModel.fromJson(dynamic json) {
    return DataModel(
      token: json["token"],
      refreshToken: json["refresh_token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
        "refresh_token": refreshToken,
      };
  @override
  String toString() => toJson().toString();
  @override
  List<Object> get props => [token, refreshToken];
}
