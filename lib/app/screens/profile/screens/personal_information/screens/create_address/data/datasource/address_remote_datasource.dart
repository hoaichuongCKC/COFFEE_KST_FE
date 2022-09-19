// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/data/models/commune.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/data/models/district.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/data/models/province.dart';

import '../../../../../../../../../core/api/api.dart';

const String BASE_URL = "https://sheltered-anchorage-60344.herokuapp.com/";

abstract class AddressRemoteDataSource {
  Future<ProvinceModel> getProvince();
  Future<DistrictModel> getDistrict(int idProvince);
  Future<CommuneModel> getCommune(int idDistrict);
}

class AddressRemoteDataSourceImpl extends AddressRemoteDataSource with Api {
  @override
  Future<CommuneModel> getCommune(int idDistrict) {
    // TODO: implement getCommune
    throw UnimplementedError();
  }

  @override
  Future<DistrictModel> getDistrict(int idProvince) {
    // TODO: implement getDistrict
    throw UnimplementedError();
  }

  @override
  Future<ProvinceModel> getProvince() async {
    String END_POINT = "/province";
    final url = BASE_URL + END_POINT;
    final response = await getService(url);
    print(response);
    return ProvinceModel.formJson(response.data);
  }
}
