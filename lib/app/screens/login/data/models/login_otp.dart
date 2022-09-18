// ignore_for_file: must_be_immutable

import 'package:coffee_kst/app/screens/login/domain/entities/login_otp.dart';

class LoginOTPModel extends LoginOTPEntity {
  LoginOTPModel({
    required super.smsCode,
    required super.verificationId,
    required super.resendToken,
  });
  factory LoginOTPModel.init() => LoginOTPModel(
        smsCode: '',
        verificationId: '',
        resendToken: 0,
      );
  @override
  String toString() =>
      'smscode: $smsCode, verificationId: $verificationId, resendToken: $resendToken';
}
