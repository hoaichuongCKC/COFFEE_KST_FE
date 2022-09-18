// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'personal_information_bloc.dart';

abstract class PersonalInformationState extends Equatable {
  const PersonalInformationState();

  @override
  List<Object> get props => [];
}

class PIInitialState extends PersonalInformationState {}

class PILoadingState extends PersonalInformationState {}

class PILoadedState extends PersonalInformationState {
  final UserEntity userEntity;
  const PILoadedState({
    required this.userEntity,
  });
  @override
  List<Object> get props => [userEntity];
}

class PIFailedState extends PersonalInformationState {
  final String message;
  const PIFailedState({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
