import 'package:coffee_kst/database/box/box_user.dart';
import 'package:coffee_kst/database/box/information_user.dart';
import 'package:coffee_kst/database/box/settings.dart';
import 'package:coffee_kst/database/hive/infor_user/infor_user.dart';
import 'package:coffee_kst/database/hive/settings/language.dart';
import 'package:coffee_kst/database/hive/settings/theme.dart';
import 'package:coffee_kst/database/hive/user.dart';
import 'package:coffee_kst/routes/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future mainDatabase() async {
  await initInformationUser();
  await initUser();
  await initSetting();
}

Future initUser() async {
  Hive.registerAdapter(UserHiveAdapter());
  //check token
  final token = await BoxesUser.instance.getDataTokenUser();

  if (token.isNotEmpty) {
    AppRoutes.initRoute = '/home';
  } else {
    AppRoutes.initRoute = '/';
  }
}

Future initSetting() async {
  Hive.registerAdapter(ThemeHiveAdapter());
  Hive.registerAdapter(LanguageHiveAdapter());
  await Hive.openBox<ThemeHive>(NAME_BOX_THEME);
  await Hive.openBox<LanguageHive>(NAME_BOX_LANGUAGE);
  BoxesSettings.instance.initialSettings();
}

Future initInformationUser() async {
  Hive.registerAdapter(InformationUserHiveAdapter());
  await Hive.openBox<InformationUserHive>(NAME_BOX_INFORMATION);
}
