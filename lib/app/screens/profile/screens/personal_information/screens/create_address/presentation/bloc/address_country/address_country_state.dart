// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'address_country_bloc.dart';

abstract class AddressCountryState extends Equatable {
  const AddressCountryState();

  @override
  List<Object> get props => [];
}

class AddressCountryInitial extends AddressCountryState {}

class AddressCountryLoadingState extends AddressCountryState {}

class AddressCountryLoadedState extends AddressCountryState {
  final ProvinceEntity? provinceEntity;
  final DistrictEntity? districtEntity;
  final CommuneEntity? communeEntity;
  const AddressCountryLoadedState({
    this.provinceEntity,
    this.districtEntity,
    this.communeEntity,
  });
  @override
  List<Object> get props => [provinceEntity!, districtEntity!, communeEntity!];
}

class AddressCountryFailedState extends AddressCountryState {
  final String message;
  const AddressCountryFailedState({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
