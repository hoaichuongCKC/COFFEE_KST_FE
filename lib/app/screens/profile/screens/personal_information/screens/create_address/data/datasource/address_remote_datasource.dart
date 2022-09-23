// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:convert';

import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/data/models/commune.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/data/models/district.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/data/models/province.dart';

import '../../../../../../../../../core/api/api.dart';

const String BASE_URL = "https://sheltered-anchorage-60344.herokuapp.com";

abstract class AddressRemoteDataSource {
  Future<List<ProvinceModel>> getProvince();
  Future<List<DistrictModel>> getDistrict(String idProvince);
  Future<List<CommuneModel>> getCommune(String idDistrict);
}

class AddressRemoteDataSourceImpl extends AddressRemoteDataSource with Api {
  @override
  Future<List<CommuneModel>> getCommune(String idDistrict) async {
    String END_POINT = "/commune";
    final url = BASE_URL + END_POINT;
    final response = await getService(url);
    final query = communeModelFromJson(jsonEncode(response.data))
        .where((element) => element.idDistrict == idDistrict)
        .toList();
    return query;
  }

  @override
  Future<List<DistrictModel>> getDistrict(String idProvince) async {
    String END_POINT = "/district";
    final url = BASE_URL + END_POINT;
    final response = await getService(url);
    final query = districtModelFromJson(jsonEncode(response.data))
        .where((element) => element.idProvince == idProvince)
        .toList();
    return query;
  }

  @override
  Future<List<ProvinceModel>> getProvince() async {
    String END_POINT = "/province";
    final url = BASE_URL + END_POINT;
    final response = await getService(url);
    return provinceModelFromJson(jsonEncode(response.data));
  }
}
