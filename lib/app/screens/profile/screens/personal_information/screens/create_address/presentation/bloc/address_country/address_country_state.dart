// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'address_country_bloc.dart';

class AddressCountryState extends Equatable {
  final ProvinceEntity provinceEntity;
  final DistrictEntity districtEntity;
  final CommuneEntity communeEntity;
  final List<ProvinceEntity> listProvince;
  final List<DistrictEntity> listDistrict;
  final List<CommuneEntity> listCommune;
  final String message;
  final String specificAddress;
  final DataAddressState state;
  const AddressCountryState(
      {this.listProvince = const [],
      this.listDistrict = const [],
      this.listCommune = const [],
      this.message = '',
      this.specificAddress = '',
      this.provinceEntity = const ProvinceEntity(name: '', idProvince: ''),
      this.districtEntity =
          const DistrictEntity(name: '', idProvince: '', idDistrict: ''),
      this.communeEntity =
          const CommuneEntity(name: '', idDistrict: '', idCommune: ''),
      this.state = const DataAddressInitial()});

  @override
  List<Object> get props => [
        provinceEntity,
        districtEntity,
        communeEntity,
        listProvince,
        listDistrict,
        listCommune,
        specificAddress,
        message,
        state
      ];

  AddressCountryState copyWith({
    ProvinceEntity? provinceEntity,
    DistrictEntity? districtEntity,
    CommuneEntity? communeEntity,
    List<ProvinceEntity>? listProvince,
    List<DistrictEntity>? listDistrict,
    List<CommuneEntity>? listCommune,
    String? message,
    String? specificAddress,
    DataAddressState? state,
  }) {
    return AddressCountryState(
      provinceEntity: provinceEntity ?? this.provinceEntity,
      districtEntity: districtEntity ?? this.districtEntity,
      communeEntity: communeEntity ?? this.communeEntity,
      listProvince: listProvince ?? this.listProvince,
      listDistrict: listDistrict ?? this.listDistrict,
      listCommune: listCommune ?? this.listCommune,
      message: message ?? this.message,
      specificAddress: specificAddress ?? this.specificAddress,
      state: state ?? this.state,
    );
  }
}

abstract class DataAddressState {
  const DataAddressState();
}

class DataAddressInitial extends DataAddressState {
  const DataAddressInitial();
}

class DataAddressLoading extends DataAddressState {
  const DataAddressLoading();
}

class DataAddressLoaded extends DataAddressState {
  const DataAddressLoaded();
}

class DataAddressFailed extends DataAddressState {
  const DataAddressFailed();
}
