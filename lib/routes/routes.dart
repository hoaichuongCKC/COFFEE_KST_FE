import 'package:coffee_kst/app/screens/home/presentation/home_screen.dart';
import 'package:coffee_kst/app/screens/login/presentations/login_screen.dart';
import 'package:coffee_kst/app/screens/login/screens/otp/otp_screen.dart';
import 'package:coffee_kst/app/screens/profile/presentation/profile_screen.dart';
import 'package:coffee_kst/app/screens/profile/screens/change_password/change_password_screen.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/presentation/create_address_screen.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/form_personal_information/form_personal_information_screen.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/personal_information/personal_information_screen.dart';
import 'package:coffee_kst/app/screens/profile/screens/settings/settings_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static String initRoute = '/';
  String get getInitRoute => initRoute;

  static final GoRouter router = GoRouter(
    initialLocation: initRoute,
    routes: <GoRoute>[
      //routes top-level
      GoRoute(
        path: '/',
        name: 'login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
        routes: [
          GoRoute(
            path: 'otp',
            name: 'otp',
            builder: (BuildContext context, GoRouterState state) {
              return const OTPScreen();
            },
          ),
        ],
      ),

      //routes top-level
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (BuildContext context, GoRouterState state) {
          return const ProfileScreen();
        },
        routes: routerProfile,
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (BuildContext context, GoRouterState state) {
          return HomeScreen();
        },
      ),
    ],
  );
}

List<GoRoute> routerProfile = [
  GoRoute(
    path: 'personal_information',
    name: 'personal_information',
    builder: (BuildContext context, GoRouterState state) {
      return const PersonalInformationScreen();
    },
    routes: [
      GoRoute(
        path: 'edit_personal_information',
        name: 'edit_personal_information',
        builder: (BuildContext context, GoRouterState state) {
          return const FormPersonalInformationScreen();
        },
        routes: [
          GoRoute(
            path: 'create_address',
            name: 'create_address',
            builder: (BuildContext context, GoRouterState state) {
              return const CreateAddressScreen();
            },
          ),
        ],
      ),
    ],
  ),
  GoRoute(
    path: 'change_password',
    name: 'change_password',
    builder: (BuildContext context, GoRouterState state) {
      return ChangePasswordScreen();
    },
  ),
  GoRoute(
    path: 'settings',
    name: 'settings',
    builder: (BuildContext context, GoRouterState state) {
      return const SettingsScreen();
    },
  ),
];
