import 'dart:io';

import 'package:coffee_kst/app/app.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/presentation/bloc/address_country/address_country_bloc.dart';
import 'package:coffee_kst/core/codegen_loader.g.dart';
import 'package:coffee_kst/init_database.dart';
import 'package:coffee_kst/injection_container.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path_provider/path_provider.dart';
import 'app/screens/profile/screens/personal_information/screens/form_personal_information/bloc/edit_information_user_bloc.dart';
import 'injection_container.dart' as di;
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Directory appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  //register database Hive
  await mainDatabase();
  await Firebase.initializeApp();
  await di.init();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VN')],
      path: 'assets/translations',
      fallbackLocale: const Locale('vi', 'VN'),
      assetLoader: const CodegenLoader(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<EditInformationUserBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<AddressCountryBloc>(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}
