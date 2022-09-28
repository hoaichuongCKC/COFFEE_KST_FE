import 'package:coffee_kst/config/theme.dart';
import 'package:coffee_kst/database/box/settings.dart';
import 'package:coffee_kst/database/hive/settings/theme.dart';
import 'package:coffee_kst/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<ThemeHive>>(
      valueListenable: Hive.box<ThemeHive>(NAME_BOX_THEME).listenable(),
      builder: (context, Box<ThemeHive> box, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          initialRoute: AppRoutes.initRoute,
          onGenerateRoute: AppRoutes.generateRoute,
          title: 'COFFEE KST',
          navigatorKey: AppRoutes.navigatorKey,
          theme: box.get(KEY_BOX_THEME)!.isDarkTheme
              ? MyThemes.darkTheme
              : MyThemes.lightTheme,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
