import 'package:coffee_kst/app/screens/cart/presentation/components/list_product.dart';
import 'package:coffee_kst/app/screens/cart/presentation/widgets/bottom_nav_cart.dart';
import 'package:coffee_kst/main_export.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavCart(),
        appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: TextWidgets(
            text: 'Giỏ hàng của bạn',
            fontSize: AppDimens.text22,
            textColor: AppColors.darkColor,
            weight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.disableTextColor.withAlpha(40),
        body: ListProductCart(),
      ),
    );
  }
}
