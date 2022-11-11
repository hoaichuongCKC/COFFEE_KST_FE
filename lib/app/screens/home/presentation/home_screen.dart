// ignore_for_file: must_be_immutable
import 'package:coffee_kst/app/screens/cart/presentation/cart_screen.dart';
import 'package:coffee_kst/app/screens/dashboard/presentation/bloc/tab_categ/change_tab_categ_cubit.dart';
import 'package:coffee_kst/app/screens/dashboard/presentation/dashboard_screen.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/navigation_bottom/navigation_screen_cubit.dart';
import 'package:coffee_kst/app/screens/home/presentation/components/body_home.dart';
import 'package:coffee_kst/app/screens/home/presentation/widgets/bottom_navigator_bar.dart';
import 'package:coffee_kst/app/screens/profile/presentation/bloc/personal_information_bloc.dart';
import 'package:coffee_kst/app/screens/profile/presentation/profile_screen.dart';
import 'package:coffee_kst/injection_container.dart';
import 'package:coffee_kst/main_export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<PersonalInformationBloc>()..add(LoadPIEvent()),
        ),
        BlocProvider(
          create: (context) => ChangeTabCategCubit(),
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
        body: BlocBuilder<NavigationScreenCubit, int>(
            buildWhen: (previous, current) => current != previous,
            builder: (context, state) {
              return IndexedStack(
                index: state,
                children: const [
                  BodyHome(),
                  DashboardScreen(),
                  CartScreen(),
                  ProfileScreen(),
                ],
              );
            }),
        bottomNavigationBar: const BottomNavigator(),
      ),
    );
  }
}
