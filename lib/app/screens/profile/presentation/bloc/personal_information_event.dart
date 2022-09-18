part of 'personal_information_bloc.dart';

abstract class PersonalInformationEvent extends Equatable {
  const PersonalInformationEvent();

  @override
  List<Object> get props => [];
}

class LoadPIEvent extends PersonalInformationEvent {}
