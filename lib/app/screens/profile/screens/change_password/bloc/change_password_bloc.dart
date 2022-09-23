// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:coffee_kst/app/screens/profile/domain/usecases/change_password_user.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/models/app_model.dart';
import 'package:coffee_kst/core/utils/const_form_state.dart';
import 'package:coffee_kst/core/utils/constants.dart';
import 'package:coffee_kst/core/utils/constants_login.dart';
import 'package:equatable/equatable.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ChangePasswordUserUsecases changePasswordUserUsecases;
  ChangePasswordBloc({required this.changePasswordUserUsecases})
      : super(const ChangePasswordState()) {
    on<InitChangedPasswordEvent>((event, emit) => emit(
          state.copyWith(
            oldPassword: '',
            formAppState: const FormInitState(),
            newPassword: '',
            confirmPassword: '',
          ),
        ));
    on<ChangedOldPasswordEvent>((event, emit) => emit(state.copyWith(
        oldPassword: event.oldPassword, formAppState: const FormInitState())));
    on<ChangedNewPasswordEvent>((event, emit) => emit(state.copyWith(
        newPassword: event.newPassword, formAppState: const FormInitState())));
    on<ChangedConfirmPasswordEvent>((event, emit) => emit(state.copyWith(
        confirmPassword: event.confirmPassword,
        formAppState: const FormInitState())));
    on<SubmitFormChangePasswordEvent>(
        (event, emit) async => _handleSubmitChangePassword(event, emit));
  }
  _handleSubmitChangePassword(SubmitFormChangePasswordEvent event,
      Emitter<ChangePasswordState> emit) async {
    emit(state.copyWith(formAppState: FormSubmittingState()));
    try {
      final result = await changePasswordUserUsecases.call(ParamsChangePassword(
          old_password: state.oldPassword, new_password: state.newPassword));
      result.fold(
        (Failure result) {
          if (result is InternetFailure) {
            emit(state.copyWith(
                message: MESSAGE_NOT_INTERNET,
                formAppState: FormSubmitFailedState()));
          } else if (result is ServerFailure) {
            emit(state.copyWith(
                message: MESSAGE_SERVER_FAILURE,
                formAppState: FormSubmitFailedState()));
          }
        },
        (AppEntity result) {
          if (result.code == SUCCESS_CODE) {
            emit(state.copyWith(
                message: result.message,
                newPassword: '',
                oldPassword: '',
                confirmPassword: '',
                formAppState: FormSubmitSuccessState()));
          } else if (result.code == FAILED_CODE) {
            emit(state.copyWith(
                message: result.message,
                formAppState: FormSubmitFailedState()));
          }
        },
      );
    } catch (e) {
      emit(state.copyWith(
          formAppState: FormSubmitFailedState(),
          message: MESSAGE_CONNECT_TIMEOUT));
    }
  }
}
