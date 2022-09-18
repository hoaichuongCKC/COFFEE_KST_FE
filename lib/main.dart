import 'dart:io';

import 'package:coffee_kst/app/app.dart';
import 'package:coffee_kst/database/box/box_user.dart';
import 'package:coffee_kst/database/hive/user.dart';

import 'package:coffee_kst/main_export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  Directory appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  Hive.registerAdapter(UserHiveAdapter());
  await Hive.openBox(NAME_BOX_USER);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}
