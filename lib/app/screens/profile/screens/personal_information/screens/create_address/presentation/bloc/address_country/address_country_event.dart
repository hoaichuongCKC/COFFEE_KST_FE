// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'address_country_bloc.dart';

abstract class AddressCountryEvent extends Equatable {
  const AddressCountryEvent();

  @override
  List<Object> get props => [];
}

class LoadAddressInit extends AddressCountryEvent {}

class LoadProvinceEvent extends AddressCountryEvent {}

class LoadDistrictEvent extends AddressCountryEvent {}

class LoadCommuneEvent extends AddressCountryEvent {}

class GetProvinceEvent extends AddressCountryEvent {
  final ProvinceEntity provinceEntity;
  const GetProvinceEvent({
    required this.provinceEntity,
  });
  @override
  List<Object> get props => [provinceEntity];
}

class GetDictrictEvent extends AddressCountryEvent {
  final DistrictEntity districtEntity;
  const GetDictrictEvent({
    required this.districtEntity,
  });
  @override
  List<Object> get props => [districtEntity];
}

class GetCommuneEvent extends AddressCountryEvent {
  final CommuneEntity communeEntity;
  const GetCommuneEvent({
    required this.communeEntity,
  });
  @override
  List<Object> get props => [communeEntity];
}

class ChangedSpecificAddressEvent extends AddressCountryEvent {
  final String specificAddress;
  const ChangedSpecificAddressEvent({
    required this.specificAddress,
  });
  @override
  List<Object> get props => [specificAddress];
}
