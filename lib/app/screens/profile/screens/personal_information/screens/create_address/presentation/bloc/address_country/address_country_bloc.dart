// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/enitites/commune.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/enitites/district.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/enitites/province.dart';
import 'package:equatable/equatable.dart';

part 'address_country_event.dart';
part 'address_country_state.dart';

class AddressCountryBloc
    extends Bloc<AddressCountryEvent, AddressCountryState> {
  AddressCountryBloc() : super(AddressCountryInitial()) {
    on<LoadProvinceEvent>((event, emit) async {});
  }
}
