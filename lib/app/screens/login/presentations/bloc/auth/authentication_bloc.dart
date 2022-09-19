// ignore_for_file: depend_on_referenced_packages, unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:coffee_kst/app/screens/login/domain/entities/login.dart';
import 'package:coffee_kst/app/screens/login/domain/entities/login_otp.dart';
import 'package:coffee_kst/app/screens/login/domain/usecases/auth_login.dart';
import 'package:coffee_kst/app/screens/login/domain/usecases/auth_otp.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/utils/const_form_state.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  //use case login
  final AuthLoginUsecases authLoginUsecases;

  //use case login
  final AuthOTPUsecases authLoginOTPUsecases;

  //init bloc and event
  AuthenticationBloc(
      {required this.authLoginUsecases, required this.authLoginOTPUsecases})
      : super(const AuthenticationState()) {
    on<ChangedPhoneEvent>(
        (event, emit) async => emit(state.copyWith(phone: event.phone)));
    on<ChangedPasswordEvent>(
        (event, emit) async => emit(state.copyWith(password: event.password)));
    on<SubmitFormEvent>((event, emit) async => _handleLogin(event, emit));

    on<SubmitFormOTPEvent>((event, emit) async => _handleLoginOTP(event, emit));
  }

  //login phone with password
  _handleLogin(SubmitFormEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(formState: FormSubmittingState()));
    try {
      final result = await authLoginUsecases.call(Params(
        phone: state.phone,
        password: state.password,
      ));
      result.fold(
        (Failure result) {
          if (result is InternetFailure) {
            emit(state.copyWith(message: MESSAGE_NOT_INTERNET));
          } else if (result is ServerFailure) {
            emit(state.copyWith(message: MESSAGE_SERVER_FAILURE));
          }
        },
        (LoginEntity result) {
          if (result.code == SUCCESS_CODE) {
            // BoxesUser.instance.setUser(
            //   UserHive(
            //       token: result.data!.token,
            //       refreshToken: result.data!.refreshToken),
            // );
            emit(state.copyWith(formState: FormSubmitSuccessState()));
          } else if (result.code == FAILED_CODE) {
            emit(state.copyWith(message: result.message));
            emit(state.copyWith(formState: FormSubmitFailedState()));
          } else if (result.code == NULL_PARAMS_CODE) {
            emit(state.copyWith(message: result.message));
            emit(state.copyWith(formState: FormSubmitFailedState()));
          }
        },
      );
    } catch (e) {
      emit(state.copyWith(message: MESSAGE_CONNECT_TIMEOUT));
      emit(state.copyWith(formState: FormSubmitFailedState()));
    }
  }

  //login phone otp
  _handleLoginOTP(
      SubmitFormOTPEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(formState: FormSubmittingState()));
    try {
      final result = await authLoginOTPUsecases.call(ParamsOTP(
        phone: state.phone,
      ));
      result.fold(
        (Failure resutl) {
          if (resutl is InternetFailure) {
            emit(state.copyWith(message: MESSAGE_NOT_INTERNET));
          } else if (result is ServerFailure) {
            emit(state.copyWith(message: MESSAGE_SERVER_FAILURE));
          }
        },
        (LoginOTPEntity result) {},
      );
    } catch (message) {
      emit(state.copyWith(message: message.toString()));
      emit(state.copyWith(formState: FormSubmitFailedState()));
    }
  }
}
