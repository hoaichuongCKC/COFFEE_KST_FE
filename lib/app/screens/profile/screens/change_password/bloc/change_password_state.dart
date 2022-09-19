// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'change_password_bloc.dart';

class ChangePasswordState extends Equatable {
  final String oldPassword;
  final String message;
  final String newPassword;
  final String confirmPassword;
  final FormAppState formAppState;
  const ChangePasswordState({
    this.oldPassword = '',
    this.newPassword = '',
    this.confirmPassword = '',
    this.message = '',
    this.formAppState = const FormInitState(),
  });

  @override
  List<Object> get props =>
      [oldPassword, message, newPassword, confirmPassword, formAppState];

  ChangePasswordState copyWith({
    String? oldPassword,
    String? message,
    String? newPassword,
    String? confirmPassword,
    FormAppState? formAppState,
  }) {
    return ChangePasswordState(
      oldPassword: oldPassword ?? this.oldPassword,
      message: message ?? this.message,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formAppState: formAppState ?? this.formAppState,
    );
  }
}
