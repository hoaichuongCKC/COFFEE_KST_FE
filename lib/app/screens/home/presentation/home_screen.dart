// ignore_for_file: must_be_immutable

import 'package:coffee_kst/app/screens/cart/presentation/cart_screen.dart';
import 'package:coffee_kst/app/screens/dashboard/presentation/dashboard_screen.dart';
import 'package:coffee_kst/app/screens/home/presentation/components/body_home.dart';
import 'package:coffee_kst/app/screens/home/presentation/widgets/bottom_navigator_bar.dart';
import 'package:coffee_kst/app/screens/profile/presentation/profile_screen.dart';
import 'package:coffee_kst/main_export.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  ValueNotifier<int> page = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ValueListenableBuilder<int>(
          valueListenable: page,
          builder: (context, int current, child) {
            return IndexedStack(
              index: current,
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
    );
  }
}
