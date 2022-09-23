// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:coffee_kst/app/screens/profile/domain/entities/user.dart';
import 'package:coffee_kst/app/screens/profile/domain/usecases/edit_information_user.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/utils/const_form_state.dart';
import 'package:coffee_kst/core/utils/constants_login.dart';
import 'package:coffee_kst/database/box/information_user.dart';
import 'package:coffee_kst/database/hive/infor_user/infor_user.dart';
import 'package:equatable/equatable.dart';

part 'edit_information_user_event.dart';
part 'edit_information_user_state.dart';

class EditInformationUserBloc
    extends Bloc<EditInformationUserEvent, EditInformationUserState> {
  //use cases
  final EditInformationUserUsecases editInformationUserUsecases;

  EditInformationUserBloc({required this.editInformationUserUsecases})
      : super(const EditInformationUserState()) {
    on<ChangedPhoneEvent>((event, emit) {
      emit(state.copyWith(phone: event.phone));
    });
    on<ChangedAddressNewEvent>((event, emit) {
      emit(state.copyWith(address: event.address));
    });
    on<ChangedFullnameEvent>((event, emit) {
      emit(state.copyWith(fullname: event.fullname));
    });
    on<ChangedGenderEvent>((event, emit) {
      emit(state.copyWith(gender: event.gender));
    });
    on<ChangedEditInitial>((event, emit) {
      emit(state.copyWith(
          gender: '',
          phone: '',
          address: '',
          fullname: '',
          state: const FormInitState()));
    });
    on<SubmitEditInformationUser>(_handleEditUser);
  }
  _handleEditUser(SubmitEditInformationUser event,
      Emitter<EditInformationUserState> emit) async {
    emit(state.copyWith(state: FormSubmittingState()));
    try {
      final result = await editInformationUserUsecases.call(
          ParamsEditInformation(
              fullname: state.fullname,
              phone: state.phone,
              gender: state.gender,
              address: state.address));

      result.fold(
        (Failure result) {
          if (result is InternetFailure) {
            emit(state.copyWith(
                message: MESSAGE_NOT_INTERNET, state: FormSubmittingState()));
          } else if (result is ServerFailure) {
            emit(state.copyWith(
                message: 'Unauthenticated', state: FormSubmittingState()));
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
          emit(state.copyWith(state: FormSubmitSuccessState()));
        },
      );
    } catch (e) {
      emit(state.copyWith(
          message: e.toString(), state: FormSubmitFailedState()));
    }
  }
}
