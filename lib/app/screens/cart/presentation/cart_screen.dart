import 'package:coffee_kst/app/screens/cart/presentation/components/list_product.dart';
import 'package:coffee_kst/main_export.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: TextWidgets(
            text: 'Giỏ hàng',
            fontSize: AppDimens.text22,
            textColor: AppColors.darkColor,
          ),
        ),
        backgroundColor: AppColors.lightColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 2,
              child: ListProductCart(),
            ),
            Expanded(
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
