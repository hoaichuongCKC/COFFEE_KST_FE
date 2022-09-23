import 'dart:convert';

import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/enitites/commune.dart';

List<CommuneModel> communeModelFromJson(String str) => List<CommuneModel>.from(
    json.decode(str).map((x) => CommuneModel.fromJson(x)));

class CommuneModel extends CommuneEntity {
  const CommuneModel(
      {required super.name,
      required super.idDistrict,
      required super.idCommune});
  factory CommuneModel.fromJson(Map<String, dynamic> json) => CommuneModel(
        name: json['name'],
        idCommune: json['idCommune'],
        idDistrict: json['idDistrict'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'idCommune': idCommune,
        'idDistrict': idDistrict,
      };

  @override
  String toString() => toJson().toString();
}
