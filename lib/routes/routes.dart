import 'package:coffee_kst/app/screens/login/presentations/login_screen.dart';
import 'package:coffee_kst/app/screens/login/screens/otp/otp_screen.dart';
import 'package:coffee_kst/app/screens/profile/domain/entities/user.dart';
import 'package:coffee_kst/app/screens/profile/presentation/profile_screen.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/form_personal_information/form_personal_information_screen.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/personal_information/personal_information_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: <GoRoute>[
      //routes top-level
      GoRoute(
        path: '/login',
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
        routes: [
          GoRoute(
            path: 'personal_information',
            name: 'personal_information',
            builder: (BuildContext context, GoRouterState state) {
              final params = state.extra;
              return PersonalInformationScreen(
                userEntity: params as UserEntity,
              );
            },
            routes: [
              GoRoute(
                path: 'form_personal_information',
                name: 'form_personal_information',
                builder: (BuildContext context, GoRouterState state) {
                  return const FormPersonalInformationScreen();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
