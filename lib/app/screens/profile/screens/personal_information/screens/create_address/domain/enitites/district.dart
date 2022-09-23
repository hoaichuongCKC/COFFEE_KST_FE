import 'package:equatable/equatable.dart';

class DistrictEntity extends Equatable {
  final String name;
  final String idDistrict;
  final String idProvince;
  const DistrictEntity({
    required this.name,
    required this.idDistrict,
    required this.idProvince,
  });
  @override
  List<Object?> get props => [idDistrict, name, idProvince];
}
