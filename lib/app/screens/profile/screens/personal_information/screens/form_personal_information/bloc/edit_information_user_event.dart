// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'edit_information_user_bloc.dart';

abstract class EditInformationUserEvent extends Equatable {
  const EditInformationUserEvent();

  @override
  List<Object> get props => [];
}

class ChangedEditInitial extends EditInformationUserEvent {}

class ChangedAddressNewEvent extends EditInformationUserEvent {
  final String address;
  const ChangedAddressNewEvent({
    required this.address,
  });
  @override
  List<Object> get props => [address];
}

class ChangedPhoneEvent extends EditInformationUserEvent {
  final String phone;
  const ChangedPhoneEvent({
    required this.phone,
  });
  @override
  List<Object> get props => [phone];
}

class ChangedFullnameEvent extends EditInformationUserEvent {
  final String fullname;
  const ChangedFullnameEvent({
    required this.fullname,
  });
  @override
  List<Object> get props => [fullname];
}

class ChangedGenderEvent extends EditInformationUserEvent {
  final String gender;
  const ChangedGenderEvent({
    required this.gender,
  });
  @override
  List<Object> get props => [gender];
}

class SubmitEditInformationUser extends EditInformationUserEvent {}
