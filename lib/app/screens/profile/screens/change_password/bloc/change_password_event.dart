// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class ChangedOldPasswordEvent extends ChangePasswordEvent {
  final String oldPassword;
  const ChangedOldPasswordEvent({
    required this.oldPassword,
  });
  @override
  List<Object> get props => [oldPassword];
}

class ChangedNewPasswordEvent extends ChangePasswordEvent {
  final String newPassword;
  const ChangedNewPasswordEvent({
    required this.newPassword,
  });
  @override
  List<Object> get props => [newPassword];
}

class ChangedConfirmPasswordEvent extends ChangePasswordEvent {
  final String confirmPassword;
  const ChangedConfirmPasswordEvent({
    required this.confirmPassword,
  });
  @override
  List<Object> get props => [confirmPassword];
}

class SubmitFormChangePasswordEvent extends ChangePasswordEvent {}
