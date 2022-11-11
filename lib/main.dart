import 'dart:io';
import 'package:coffee_kst/app/app.dart';
import 'package:coffee_kst/app/screens/detail/presentation/bloc/detail_service/product_detail_bloc.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/navigation_bottom/navigation_screen_cubit.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/product/product_bloc.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/product_type/product_type_bloc.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/voucher/voucher_bloc.dart';
import 'package:coffee_kst/app/screens/login/presentations/bloc/auth_phone/auth_phone_bloc.dart';
import 'package:coffee_kst/app/screens/pay/bloc/cubit/payment_invoice_cubit.dart';
import 'package:coffee_kst/app/screens/profile/screens/my_invoice/bloc/cubit/my_invoice_cubit.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/form_personal_information/bloc/edit_information_user_bloc.dart';
import 'package:coffee_kst/core/codegen_loader.g.dart';
import 'package:coffee_kst/init_database.dart';
import 'package:coffee_kst/injection_container.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path_provider/path_provider.dart';
import 'app/screens/cart/presentation/bloc/bloc_cart/cart_bloc.dart';
import 'app/screens/profile/screens/personal_information/screens/create_address/presentation/bloc/address_country/address_country_bloc.dart';
import 'injection_container.dart' as di;
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  Directory appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  await mainDatabase();
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
            create: (context) => sl<NavigationScreenCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<AuthPhoneBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<ProductDetaiServicelBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<AddressCountryBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<EditInformationUserBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<ProductBloc>()..add(LoadAllProductEvent()),
          ),
          BlocProvider(
            create: (context) =>
                sl<ProductTypeBloc>()..add(LoadTypeProductEvent()),
          ),
          BlocProvider(
            create: (context) => sl<CartServiceBloc>()..add(LoadCartEvent()),
          ),
          BlocProvider(
            create: (context) => sl<VoucherHomeBloc>()..add(LoadVoucherEvent()),
          ),
          BlocProvider(create: (context) => sl<PaymentInvoiceCubit>()),
          BlocProvider(
            create: (context) => sl<MyInvoiceCubit>()..getAllOrder(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}
