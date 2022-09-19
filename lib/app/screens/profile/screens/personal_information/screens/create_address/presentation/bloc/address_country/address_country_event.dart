part of 'address_country_bloc.dart';

abstract class AddressCountryEvent extends Equatable {
  const AddressCountryEvent();

  @override
  List<Object> get props => [];
}

class LoadProvinceEvent extends AddressCountryEvent {}

class LoadDistrictEvent extends AddressCountryEvent {}

class LoadCommuneEvent extends AddressCountryEvent {}
