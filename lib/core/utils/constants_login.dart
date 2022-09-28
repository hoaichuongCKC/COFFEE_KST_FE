//--------------------------------------------------------------------------------------//
//const Login
// ignore_for_file: constant_identifier_names

import 'package:coffee_kst/core/locale_keys.g.dart';

enum LoginMethod {
  OTP_LOGIN,
  PASSWORD_LOGIN,
}

const String LOGIN_WITH_PHONE = LocaleKeys.login_with_phone;
const String LOGIN_WITH_PASSWORD = LocaleKeys.login_with_password;
const String MESSAGE_NOT_INTERNET = "Lỗi! Vui lòng kiểm tra mạng";
const String MESSAGE_SERVER_FAILURE = "Lỗi Server";
const String MESSAGE_CONNECT_TIMEOUT = "Connect timeout!!";

//MESSAGE WHEN HANDLE LOGIN
