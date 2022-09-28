import 'package:coffee_kst/app/screens/home/presentation/components/best_seller_home.dart';
import 'package:coffee_kst/app/screens/home/presentation/components/categories_home.dart';
import 'package:coffee_kst/app/screens/home/presentation/components/header_home_page.dart';
import 'package:coffee_kst/main_export.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            HeaderHomePage(),
            CategoriesHome(),
            BestSellerHome(),
          ],
        ),
      ),
    );
  }
}
