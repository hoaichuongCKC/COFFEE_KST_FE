// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'edit_information_user_bloc.dart';

class EditInformationUserState extends Equatable {
  final String address;
  final String fullname;
  final String phone;
  final String gender;
  final String message;
  final FormAppState state;
  const EditInformationUserState(
      {this.address = '',
      this.fullname = '',
      this.phone = '',
      this.message = '',
      this.gender = '',
      this.state = const FormInitState()});
  @override
  List<Object> get props => [fullname, phone, gender, address, state, message];

  EditInformationUserState copyWith({
    String? address,
    String? fullname,
    String? phone,
    String? message,
    String? gender,
    FormAppState? state,
  }) {
    return EditInformationUserState(
      address: address ?? this.address,
      fullname: fullname ?? this.fullname,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      state: state ?? this.state,
      message: message ?? this.message,
    );
  }
}
