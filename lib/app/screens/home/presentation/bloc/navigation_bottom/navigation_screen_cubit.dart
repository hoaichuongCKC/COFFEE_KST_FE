// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_screen_state.dart';

class NavigationScreenCubit extends Cubit<int> {
  NavigationScreenCubit() : super(0);
  void changeNavigatorBottom(NavigationScreenState state) {
    if (state == const HomeScreenState()) {
      emit(0);
    } else if (state == const DashboardScreenState()) {
      emit(1);
    } else if (state == const CartScreenState()) {
      emit(2);
    } else if (state == const ProfileScreenState()) {
      emit(3);
    }
  }
}
