import 'package:coffee_kst/app/app.dart';
import 'package:coffee_kst/database/box/box_user.dart';

import 'package:coffee_kst/main_export.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Hive.initFlutter();
  await Hive.openBox(NAME_BOX_USER);
  runApp(const MyApp());
}
