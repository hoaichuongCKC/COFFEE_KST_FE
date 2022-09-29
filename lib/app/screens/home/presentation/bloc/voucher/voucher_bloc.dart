// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/core/usecases/usecase.dart';
import 'package:coffee_kst/core/utils/constants_login.dart';
import 'package:equatable/equatable.dart';

import 'package:coffee_kst/app/screens/home/domain/entities/voucher.dart';
import 'package:coffee_kst/app/screens/home/domain/usecase/get_voucher.dart';

part 'voucher_event.dart';
part 'voucher_state.dart';

class VoucherHomeBloc extends Bloc<VoucherHomeEvent, VoucherHomeState> {
  GetListVoucherUseCase getListVoucherUseCase;
  VoucherHomeBloc(
    this.getListVoucherUseCase,
  ) : super(VoucherInitial()) {
    on<LoadVoucherEvent>((_handelLoadVoucher));
  }
  _handelLoadVoucher(
      LoadVoucherEvent event, Emitter<VoucherHomeState> emit) async {
    emit(VoucherLoading());
    try {
      final result = await getListVoucherUseCase.call(NoParams());
      result.fold(
        (Failure l) {
          if (l is InternetFailure) {
            emit(const VoucherLoadFailed(message: MESSAGE_NOT_INTERNET));
          } else if (l is ServerFailure) {
            emit(const VoucherLoadFailed(message: MESSAGE_SERVER_FAILURE));
          }
        },
        (List<VoucherEntity> r) {
          emit(VoucherLoaded(list: r));
        },
      );
    } catch (e) {
      emit(VoucherLoadFailed(message: e.toString()));
    }
  }
}
