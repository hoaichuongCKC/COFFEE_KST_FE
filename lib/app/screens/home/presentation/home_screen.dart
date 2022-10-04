// ignore_for_file: must_be_immutable

import 'package:coffee_kst/app/screens/cart/presentation/cart_screen.dart';
import 'package:coffee_kst/app/screens/dashboard/presentation/dashboard_screen.dart';
import 'package:coffee_kst/app/screens/home/presentation/components/body_home.dart';
import 'package:coffee_kst/app/screens/home/presentation/widgets/bottom_navigator_bar.dart';
import 'package:coffee_kst/app/screens/profile/presentation/bloc/personal_information_bloc.dart';
import 'package:coffee_kst/app/screens/profile/presentation/profile_screen.dart';
import 'package:coffee_kst/injection_container.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/product/product_bloc.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/product_type/product_type_bloc.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/voucher/voucher_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  ValueNotifier<int> page = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<PersonalInformationBloc>()..add(LoadPIEvent()),
        ),
        BlocProvider(
          create: (context) =>
              sl<ProductTypeBloc>()..add(LoadTypeProductEvent()),
        ),
        BlocProvider(
          create: (context) => sl<VoucherHomeBloc>()..add(LoadVoucherEvent()),
        ),
        BlocProvider(
          create: (context) => sl<ProductBloc>()..add(LoadListProductEvent()),
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
        body: ValueListenableBuilder<int>(
            valueListenable: page,
            builder: (context, int current, child) {
              return IndexedStack(
                index: current,
                key: PageStorageKey(page.value),
                children: const [
                  BodyHome(),
                  DashboardScreen(),
                  CartScreen(),
                  ProfileScreen(),
                ],
              );
            }),
        bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: page,
          builder: (context, int current, child) {
            return BottomNavigator(
              currentPage: current,
              onChanged: (currentPage) {
                page.value = currentPage;
              },
            );
          },
        ),
      ),
    );
  }
}
