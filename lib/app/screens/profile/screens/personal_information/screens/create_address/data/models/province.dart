import 'dart:convert';

import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/enitites/province.dart';

List<ProvinceModel> provinceModelFromJson(String str) =>
    List<ProvinceModel>.from(
        json.decode(str).map((x) => ProvinceModel.fromJson(x)));

class ProvinceModel extends ProvinceEntity {
  const ProvinceModel({required super.name, required super.idProvince});

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
        name: json['name'],
        idProvince: json['idProvince'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'idProvince': idProvince,
      };

  @override
  String toString() => toJson().toString();
}
