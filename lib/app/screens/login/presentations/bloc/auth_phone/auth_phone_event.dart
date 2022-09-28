part of 'auth_phone_bloc.dart';

abstract class AuthPhoneEvent extends Equatable {
  const AuthPhoneEvent();

  @override
  List<Object> get props => [];
}

class SendOtpToPhoneEvent extends AuthPhoneEvent {
  final String phoneNumber;

  const SendOtpToPhoneEvent({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}

class VerifySentOtpEvent extends AuthPhoneEvent {
  final String otpCode;
  final String verificationId;

  const VerifySentOtpEvent(
      {required this.otpCode, required this.verificationId});

  @override
  List<Object> get props => [otpCode, verificationId];
}

class OnPhoneOtpSent extends AuthPhoneEvent {
  final String verificationId;
  final int? token;
  const OnPhoneOtpSent({
    required this.verificationId,
    required this.token,
  });

  @override
  List<Object> get props => [verificationId];
}

class OnPhoneAuthErrorEvent extends AuthPhoneEvent {
  final String error;
  const OnPhoneAuthErrorEvent({required this.error});

  @override
  List<Object> get props => [error];
}

class OnGetOTPEvent extends AuthPhoneEvent {
  final String otpCode;
  const OnGetOTPEvent({required this.otpCode});

  @override
  List<Object> get props => [otpCode];
}
