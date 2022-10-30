import 'package:coffee_kst/app/common/widgets/appbar_widget.dart';
import 'package:coffee_kst/app/screens/pay/components/show_address.dart';
import 'package:coffee_kst/app/screens/pay/components/show_infor_customer.dart';
import 'package:coffee_kst/app/screens/pay/components/show_invoice.dart';
import 'package:coffee_kst/app/screens/pay/widgets/bottom_nav_pay.dart';
import 'package:coffee_kst/main_export.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      appBar: AppBarWidget(title: 'Thanh toán đơn hàng', context: context),
      backgroundColor: AppColors.lightColor,
      bottomNavigationBar: const BottomNavPay(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            ShowAddress(),
            Divider(),
            ShowMyInvoice(),
            SizedBox(height: 14.0),
            ShowInforCustomer(),
          ],
        ),
      ),
    );
  }
}
