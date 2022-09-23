import 'dart:convert';

import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/enitites/district.dart';

List<DistrictModel> districtModelFromJson(String str) =>
    List<DistrictModel>.from(
        json.decode(str).map((x) => DistrictModel.fromJson(x)));

class DistrictModel extends DistrictEntity {
  const DistrictModel(
      {required super.name,
      required super.idDistrict,
      required super.idProvince});

  factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        name: json['name'],
        idProvince: json['idProvince'],
        idDistrict: json['idDistrict'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'idProvince': idProvince,
        'idDistrict': idDistrict,
      };

  @override
  String toString() => toJson().toString();
}
