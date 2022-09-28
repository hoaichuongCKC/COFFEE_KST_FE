// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AuthInitEvent extends AuthenticationEvent {
  const AuthInitEvent();
}

class ChangedPhoneEvent extends AuthenticationEvent {
  final String phone;
  const ChangedPhoneEvent({
    required this.phone,
  });
}

class ChangedPasswordEvent extends AuthenticationEvent {
  final String password;
  const ChangedPasswordEvent({
    required this.password,
  });
}

class SubmitFormEvent extends AuthenticationEvent {}
