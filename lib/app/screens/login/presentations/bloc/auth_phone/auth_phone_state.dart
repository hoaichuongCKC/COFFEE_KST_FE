// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_phone_bloc.dart';

class AuthPhoneState extends Equatable {
  const AuthPhoneState(
      {this.messageError = '',
      this.otpCode = '',
      this.verificationId = '',
      this.state = const AuthPhoneInitial()});
  final String messageError;
  final String otpCode;
  final String verificationId;
  final OtpState state;
  @override
  List<Object> get props => [messageError, otpCode, verificationId, state];

  AuthPhoneState copyWith({
    String? messageError,
    String? otpCode,
    String? verificationId,
    OtpState? state,
  }) {
    return AuthPhoneState(
      messageError: messageError ?? this.messageError,
      otpCode: otpCode ?? this.otpCode,
      verificationId: verificationId ?? this.verificationId,
      state: state ?? this.state,
    );
  }
}

abstract class OtpState {
  const OtpState();
}

class AuthPhoneInitial extends OtpState {
  const AuthPhoneInitial();
}

class AuthPhoneLoading extends OtpState {
  const AuthPhoneLoading();
}

class AuthPhoneError extends OtpState {
  const AuthPhoneError();
}

class AuthPhoneVerified extends OtpState {
  const AuthPhoneVerified();
}

class AuthPhoneCodeSentSuccess extends OtpState {
  const AuthPhoneCodeSentSuccess();
}
