// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

@immutable
class AuthenticationState extends Equatable {
  final String phone;
  final String password;
  final String message;
  final FormAppState formState;
  const AuthenticationState({
    this.phone = '',
    this.password = '',
    this.message = '',
    this.formState = const FormInitState(),
  });

  AuthenticationState copyWith({
    String? phone,
    String? password,
    String? message,
    FormAppState? formState,
  }) {
    return AuthenticationState(
      phone: phone ?? this.phone,
      password: password ?? this.password,
      message: message ?? this.message,
      formState: formState ?? this.formState,
    );
  }

  @override
  List<Object?> get props => [phone, password, message, formState];
}
