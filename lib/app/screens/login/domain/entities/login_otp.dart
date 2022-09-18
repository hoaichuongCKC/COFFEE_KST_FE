// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:equatable/equatable.dart';

class LoginOTPEntity extends Equatable {
  String smsCode;
  String verificationId;
  int resendToken;

  LoginOTPEntity({
    required this.smsCode,
    required this.verificationId,
    required this.resendToken,
  });
  @override
  List<Object> get props => [smsCode, verificationId, resendToken];

  LoginOTPEntity copyWith({
    String? smsCode,
    String? verificationId,
    int? resendToken,
  }) {
    return LoginOTPEntity(
      smsCode: smsCode ?? this.smsCode,
      verificationId: verificationId ?? this.verificationId,
      resendToken: resendToken ?? this.resendToken,
    );
  }
}
