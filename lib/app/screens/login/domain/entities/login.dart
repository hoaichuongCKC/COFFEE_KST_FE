// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final int code;
  final bool validateToken;
  final String message;
  final DataEntity? data;
  const LoginEntity({
    required this.code,
    required this.validateToken,
    required this.message,
    this.data,
  });
  @override
  List<Object> get props => [code, validateToken, message, data!];
}

class DataEntity extends Equatable {
  const DataEntity({
    required this.token,
    required this.refreshToken,
  });

  final String token;
  final String refreshToken;

  @override
  List<Object> get props => [token, refreshToken];
}
