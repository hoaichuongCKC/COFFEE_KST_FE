import 'package:coffee_kst/main_export.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: TextWidgets(
              text: 'Cart Page',
              textColor: Theme.of(context).textTheme.bodyMedium!.color!,
            ),
          )
        ],
      ),
    );
  }
}
