import 'package:coffee_kst/app/screens/login/presentations/login_screen.dart';
import 'package:coffee_kst/config/theme.dart';
import 'package:coffee_kst/routes/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: AppRoutes.router.routeInformationProvider,
      routeInformationParser: AppRoutes.router.routeInformationParser,
      routerDelegate: AppRoutes.router.routerDelegate,
      title: 'COFFEE KST',
      theme: themeDataDark,
      debugShowCheckedModeBanner: false,
    );
  }
}
