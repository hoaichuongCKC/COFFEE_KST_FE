// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/enitites/commune.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/enitites/district.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/enitites/province.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/usecases/get_commnue.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/usecases/get_district.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/usecases/get_province.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';
import 'package:coffee_kst/core/utils/constants_login.dart';
import 'package:equatable/equatable.dart';
part 'address_country_event.dart';
part 'address_country_state.dart';

class AddressCountryBloc
    extends Bloc<AddressCountryEvent, AddressCountryState> {
  GetProvinceUseCase getProvinceUseCase;
  GetDistrictUseCase getDistrictUseCase;
  GetCommuneUsecase getCommuneUsecase;
  List<ProvinceEntity> listProvice = [];

  AddressCountryBloc(
      {required this.getProvinceUseCase,
      required this.getDistrictUseCase,
      required this.getCommuneUsecase})
      : super(const AddressCountryState()) {
    on<ChangedSpecificAddressEvent>((event, emit) =>
        emit(state.copyWith(specificAddress: event.specificAddress)));
    on<GetProvinceEvent>((event, emit) {
      emit(state.copyWith(
          provinceEntity: event.provinceEntity,
          districtEntity:
              const DistrictEntity(name: '', idDistrict: '', idProvince: ''),
          communeEntity:
              const CommuneEntity(name: '', idDistrict: '', idCommune: ''),
          state: const DataAddressInitial()));
    });
    on<GetDictrictEvent>((event, emit) => emit(state.copyWith(
        districtEntity: event.districtEntity,
        communeEntity:
            const CommuneEntity(name: '', idDistrict: '', idCommune: ''))));
    on<GetCommuneEvent>((event, emit) =>
        emit(state.copyWith(communeEntity: event.communeEntity)));
    on<LoadAddressInit>((event, emit) => emit(state.copyWith(
        provinceEntity: const ProvinceEntity(name: '', idProvince: ''),
        districtEntity:
            const DistrictEntity(name: '', idDistrict: '', idProvince: ''),
        communeEntity: const CommuneEntity(
          name: '',
          idDistrict: '',
          idCommune: '',
        ),
        specificAddress: '',
        state: const DataAddressInitial())));
    on<LoadProvinceEvent>(_handleLoadProvince);
    on<LoadDistrictEvent>(_handleLoadDistrict);
    on<LoadCommuneEvent>(_handleLoadCommune);
  }
  _handleLoadProvince(
      LoadProvinceEvent event, Emitter<AddressCountryState> emit) async {
    if (listProvice.isNotEmpty) {
      emit(state.copyWith(
          listProvince: listProvice, state: const DataAddressLoaded()));
    } else {
      emit(state.copyWith(state: const DataAddressLoading()));
      try {
        final result = await getProvinceUseCase.call(NoParams());
        result.fold(
          (Failure left) {
            if (result is InternetFailure) {
              emit(state.copyWith(
                  state: const DataAddressFailed(),
                  message: MESSAGE_NOT_INTERNET));
            } else if (result is ServerFailure) {
              emit(state.copyWith(
                  state: const DataAddressFailed(),
                  message: MESSAGE_SERVER_FAILURE));
            }
          },
          (List<ProvinceEntity> right) {
            listProvice = right;
            emit(state.copyWith(
                state: const DataAddressLoaded(), listProvince: right));
          },
        );
      } catch (e) {
        emit(state.copyWith(
            state: const DataAddressFailed(), message: e.toString()));
      }
    }
  }

  _handleLoadDistrict(
      LoadDistrictEvent event, Emitter<AddressCountryState> emit) async {
    emit(state.copyWith(state: const DataAddressLoading()));
    try {
      final result = await getDistrictUseCase
          .call(ParamsDistrict(idProvince: state.provinceEntity.idProvince));
      result.fold(
        (Failure left) {
          if (result is InternetFailure) {
            emit(state.copyWith(
                state: const DataAddressFailed(),
                message: MESSAGE_NOT_INTERNET));
          } else if (result is ServerFailure) {
            emit(state.copyWith(
                state: const DataAddressFailed(),
                message: MESSAGE_SERVER_FAILURE));
          }
        },
        (List<DistrictEntity> right) {
          emit(state.copyWith(
              state: const DataAddressLoaded(), listDistrict: right));
        },
      );
    } catch (e) {
      emit(state.copyWith(
          state: const DataAddressFailed(), message: e.toString()));
    }
  }

  _handleLoadCommune(
      LoadCommuneEvent event, Emitter<AddressCountryState> emit) async {
    emit(state.copyWith(state: const DataAddressLoading()));
    try {
      final result = await getCommuneUsecase
          .call(ParamsCommune(idDistrict: state.districtEntity.idDistrict));
      result.fold(
        (Failure left) {
          if (result is InternetFailure) {
            emit(state.copyWith(
                state: const DataAddressFailed(),
                message: MESSAGE_NOT_INTERNET));
          } else if (result is ServerFailure) {
            emit(state.copyWith(
                state: const DataAddressFailed(),
                message: MESSAGE_SERVER_FAILURE));
          }
        },
        (List<CommuneEntity> right) {
          emit(state.copyWith(
              state: const DataAddressLoaded(), listCommune: right));
        },
      );
    } catch (e) {
      emit(state.copyWith(
          state: const DataAddressFailed(), message: e.toString()));
    }
  }
}
