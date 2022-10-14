// ignore_for_file: constant_identifier_names
import 'package:coffee_kst/app/common/animations/push_screen/slide_top_left.dart';
import 'package:coffee_kst/app/screens/detail/presentation/detail_screen.dart';
import 'package:coffee_kst/app/screens/home/presentation/home_screen.dart';
import 'package:coffee_kst/app/screens/home/screens/notification/notification_screen.dart';
import 'package:coffee_kst/app/screens/login/presentations/login_screen.dart';
import 'package:coffee_kst/app/screens/login/screens/otp/otp_screen.dart';
import 'package:coffee_kst/app/screens/profile/screens/change_password/change_password_screen.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/presentation/create_address_screen.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/form_personal_information/form_personal_information_screen.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/personal_information/personal_information_screen.dart';
import 'package:coffee_kst/app/screens/profile/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';

//router -- alone
const String DETAIL_PATH = '/detail';

//router login
const String LOGIN_PATH = '/';
const String OTP_PATH = '/otp';
const String CREATE_ACCOUNT_PATH = '/create_account';

//router home
const String HOME_PATH = '/home';
const String NOTIFICATION_PATH = 'home/notification';

//router profile
const String PROFILE_PATH = '/profile';
const String SETTING_PATH_PROFILE = '$PROFILE_PATH/setting';
const String CHANGE_PASSWORD_PATH_PROFILE = '$PROFILE_PATH/change_password';
const String INFORMATION_PATH_PROFILE = '$PROFILE_PATH/information';
const String EDIT_PATH_PROFILE_INFORMATION =
    '$INFORMATION_PATH_PROFILE/edit_information';
const String CREATE_ADDRESS_PATH_PROFILE_INFORMATION =
    '$EDIT_PATH_PROFILE_INFORMATION/create_address';

class AppRoutes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static String initRoute = '/';

  String get getInitRoute => initRoute;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //router login
      case DETAIL_PATH:
        return MaterialPageRoute(builder: (_) => const DetailScreen());
      //router login
      case LOGIN_PATH:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case OTP_PATH:
        return MaterialPageRoute(builder: (_) => const OTPScreen());
      case CREATE_ACCOUNT_PATH:
        return MaterialPageRoute(builder: (_) => const CreateAddressScreen());
      //router home
      case HOME_PATH:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );

      case NOTIFICATION_PATH:
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
        );

      //router profile
      case INFORMATION_PATH_PROFILE:
        return PushSlideToLeft(child: const PersonalInformationScreen());

      case EDIT_PATH_PROFILE_INFORMATION:
        return PushSlideToLeft(child: const FormPersonalInformationScreen());

      case CREATE_ADDRESS_PATH_PROFILE_INFORMATION:
        return PushSlideToLeft(child: const CreateAddressScreen());

      case CHANGE_PASSWORD_PATH_PROFILE:
        return PushSlideToLeft(child: ChangePasswordScreen());

      case SETTING_PATH_PROFILE:
        return PushSlideToLeft(child: const SettingsScreen());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }

  static pushNamed(String route) {
    navigatorKey.currentState!.pushNamed(route);
  }

  static pop() {
    navigatorKey.currentState!.pop();
  }

  static pushNameAndRemoveUntil(String route) {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(route, (route) => false);
  }
}
