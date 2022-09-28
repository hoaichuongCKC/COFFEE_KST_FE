// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_phone_event.dart';
part 'auth_phone_state.dart';

class AuthPhoneBloc extends Bloc<AuthPhoneEvent, AuthPhoneState> {
  final auth = FirebaseAuth.instance;
  AuthPhoneBloc() : super(const AuthPhoneState()) {
    // When user clicks on send otp button then this event will be fired
    on<SendOtpToPhoneEvent>(_onSendOtp);

    // After receiving the otp, When user clicks on verify otp button then this event will be fired
    on<VerifySentOtpEvent>(_onVerifyOtp);

    on<OnGetOTPEvent>(
      (event, emit) {
        emit(state.copyWith(
            otpCode: event.otpCode, state: const AuthPhoneCodeSentSuccess()));
        print(state.otpCode);
      },
    );
    on<OnPhoneOtpSent>(
      (event, emit) {
        emit(state.copyWith(verificationId: event.verificationId));
        print(state.verificationId);
      },
    );
    // When any error occurs while sending otp to the user's phone, this event will be fired
    on<OnPhoneAuthErrorEvent>((event, emit) => emit(state.copyWith(
        state: const AuthPhoneError(), messageError: event.error.toString())));
  }
  FutureOr<void> _onSendOtp(
      SendOtpToPhoneEvent event, Emitter<AuthPhoneState> emit) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: '+84 ${event.phoneNumber}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          // add(OnGetOTPEvent(otpCode: credential.smsCode!));
          // On [verificationComplete], we will get the credential from the firebase  and will send it to the [OnPhoneAuthVerificationCompleteEvent] event to be handled by the bloc and then will emit the [PhoneAuthVerified] state after successful login
        },
        verificationFailed: (FirebaseAuthException e) {
          // On [verificationFailed], we will get the exception from the firebase and will send it to the [OnPhoneAuthErrorEvent] event to be handled by the bloc and then will emit the [PhoneAuthError] state in order to display the error to the user's screen
          add(OnPhoneAuthErrorEvent(error: e.code));
        },
        codeSent: (String verificationId, int? resendToken) {
          // On [codeSent], we will get the verificationId and the resendToken from the firebase and will send it to the [OnPhoneOtpSent] event to be handled by the bloc and then will emit the [OnPhoneAuthVerificationCompleteEvent] event after receiving the code from the user's phone
          add(OnPhoneOtpSent(
              verificationId: verificationId, token: resendToken));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      emit(state.copyWith(
          state: const AuthPhoneError(), messageError: e.toString()));
    }
  }

  FutureOr<void> _onVerifyOtp(
      VerifySentOtpEvent event, Emitter<AuthPhoneState> emit) async {
    emit(state.copyWith(state: const AuthPhoneLoading()));
    try {
      // After receiving the otp, we will verify the otp and then will create a credential from the otp and verificationId and then will send it to the [OnPhoneAuthVerificationCompleteEvent] event to be handled by the bloc and then will emit the [PhoneAuthVerified] state after successful login
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: state.verificationId,
        smsCode: state.otpCode,
      );
      await auth.signInWithCredential(credential).then((user) {
        if (user.user != null) {
          emit(state.copyWith(state: const AuthPhoneVerified()));
        }
      });
    } catch (e) {
      emit(state.copyWith(
          state: const AuthPhoneError(), messageError: e.toString()));
    }
  }
}
