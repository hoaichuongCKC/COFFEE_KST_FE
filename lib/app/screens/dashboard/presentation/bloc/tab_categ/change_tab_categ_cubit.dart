// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:coffee_kst/core/utils/home.dart';
import 'package:equatable/equatable.dart';

part 'change_tab_categ_state.dart';

class ChangeTabCategCubit extends Cubit<ChangeTabCategState> {
  ChangeTabCategCubit() : super(const ChangeTabCategState(currentTab: ALL));

  void changeTab(String tab) {
    emit(state.copyWith(currentTab: tab));
  }
}
