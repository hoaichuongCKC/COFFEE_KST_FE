// ignore_for_file: depend_on_referenced_packages, unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:coffee_kst/app/screens/profile/domain/entities/user.dart';
import 'package:coffee_kst/app/screens/profile/domain/usecases/get_information_user.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';
import 'package:coffee_kst/database/box/information_user.dart';
import 'package:coffee_kst/database/hive/infor_user/infor_user.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:equatable/equatable.dart';

part 'personal_information_event.dart';
part 'personal_information_state.dart';

class PersonalInformationBloc
    extends Bloc<PersonalInformationEvent, PersonalInformationState> {
  final GetInformationUserUsecases getInformationUserUsecases;
  PersonalInformationBloc({required this.getInformationUserUsecases})
      : super(PIInitialState()) {
    on<LoadPIEvent>(_handleLoadProfile);
  }
  _handleLoadProfile(
      LoadPIEvent event, Emitter<PersonalInformationState> emit) async {
    if (state is PILoadedState) return;

    emit(PILoadingState());
    try {
      final result = await getInformationUserUsecases.call(NoParams());

      result.fold(
        (Failure result) {
          if (result is InternetFailure) {
            emit(const PIFailedState(message: MESSAGE_NOT_INTERNET));
          } else if (result is ServerFailure) {
            emit(const PIFailedState(message: MESSAGE_SERVER_FAILURE));
          }
        },
        (UserEntity result) {
          BoxesInformationUser.instance.saveInformationUser(InformationUserHive(
            result.userId,
            result.phone,
            result.fullname,
            result.fullAddress,
            result.gender,
            result.avatarUrl,
          ));
          emit(PILoadedState(userEntity: result));
        },
      );
    } catch (e) {
      emit(PIFailedState(message: e.toString()));
    }
  }
}
