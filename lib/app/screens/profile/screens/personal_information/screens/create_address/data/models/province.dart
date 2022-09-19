import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/enitites/province.dart';

class ProvinceModel extends ProvinceEntity {
  const ProvinceModel({required super.name, required super.idProvince});

  factory ProvinceModel.formJson(Map<String, dynamic> json) => ProvinceModel(
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
