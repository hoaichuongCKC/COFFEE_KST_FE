part of 'navigation_screen_cubit.dart';

abstract class NavigationScreenState extends Equatable {
  const NavigationScreenState();

  @override
  List<Object> get props => [];
}

class HomeScreenState extends NavigationScreenState {
  const HomeScreenState();
}

class DashboardScreenState extends NavigationScreenState {
  const DashboardScreenState();
}

class CartScreenState extends NavigationScreenState {
  const CartScreenState();
}

class ProfileScreenState extends NavigationScreenState {
  const ProfileScreenState();
}
