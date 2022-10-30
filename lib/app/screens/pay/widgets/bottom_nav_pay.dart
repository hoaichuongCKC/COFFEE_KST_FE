import 'package:coffee_kst/main_export.dart';

class BottomNavPay extends StatelessWidget {
  const BottomNavPay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: ButtonWidget(
        label: 'Đặt hàng',
        onClicked: () {},
      ),
    );
  }
}
