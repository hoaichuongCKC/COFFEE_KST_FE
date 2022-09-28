// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

@immutable
class AuthenticationState extends Equatable {
  final String phone;
  final String password;
  final String message;
  final String smsCode;
  final String verificationId;
  final int resendToken;
  final FormAppState formState;
  const AuthenticationState({
    this.phone = '',
    this.password = '',
    this.message = '',
    this.smsCode = '',
    this.verificationId = '',
    this.resendToken = 0,
    this.formState = const FormInitState(),
  });

  AuthenticationState copyWith({
    String? phone,
    String? password,
    String? message,
    String? smsCode,
    String? verificationId,
    int? resendToken,
    FormAppState? formState,
  }) {
    return AuthenticationState(
      phone: phone ?? this.phone,
      password: password ?? this.password,
      message: message ?? this.message,
      smsCode: smsCode ?? this.smsCode,
      verificationId: verificationId ?? this.verificationId,
      resendToken: resendToken ?? this.resendToken,
      formState: formState ?? this.formState,
    );
  }

  @override
  List<Object?> get props => [
        smsCode,
        resendToken,
        verificationId,
        phone,
        password,
        message,
        formState
      ];
}
