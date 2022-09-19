import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/enitites/commune.dart';

class CommuneModel extends CommuneEntity {
  const CommuneModel(
      {required super.name,
      required super.idDistrict,
      required super.idCommune});
  factory CommuneModel.formJson(Map<String, dynamic> json) => CommuneModel(
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
