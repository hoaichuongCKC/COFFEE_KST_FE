import 'package:coffee_kst/app/screens/home/presentation/components/best_seller_home.dart';
import 'package:coffee_kst/app/screens/home/presentation/components/categories_home.dart';
import 'package:coffee_kst/app/screens/home/presentation/components/header_home_page.dart';
import 'package:coffee_kst/app/screens/home/presentation/components/recommend_product.dart';
import 'package:coffee_kst/app/screens/home/presentation/components/voucher_home.dart';
import 'package:coffee_kst/main_export.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          HeaderHomePage(),
          CategoriesHome(),
          BestSellerHome(),
          VoucherHome(),
          RecommendTitleHome(),
        ],
      ),
    );
  }
}
