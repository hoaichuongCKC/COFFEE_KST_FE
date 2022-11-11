import 'package:coffee_kst/app/common/widgets/appbar_widget.dart';
import 'package:coffee_kst/app/screens/profile/screens/my_invoice/components/cancled_order_view.dart';
import 'package:coffee_kst/app/screens/profile/screens/my_invoice/components/confirm_order_view.dart';
import 'package:coffee_kst/app/screens/profile/screens/my_invoice/components/delivering_order_view.dart';
import 'package:coffee_kst/app/screens/profile/screens/my_invoice/components/new_order_view.dart';
import 'package:coffee_kst/app/screens/profile/screens/my_invoice/components/successful_order_view.dart';
import 'package:coffee_kst/app/screens/profile/screens/my_invoice/components/tabbar_invoice.dart';
import 'package:coffee_kst/main_export.dart';

class MyInvoiceScreen extends StatefulWidget {
  const MyInvoiceScreen({super.key});

  @override
  State<MyInvoiceScreen> createState() => _MyInvoiceScreenState();
}

class _MyInvoiceScreenState extends State<MyInvoiceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBarWidget(title: 'Đơn hàng của tôi', context: context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TabbarInvoice(controller: _controller),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: AppColors.disableTextColor.withAlpha(30)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 14.0),
                  child: TabBarView(
                    controller: _controller,
                    children: const [
                      NewOrderView(),
                      ConfirmOrderView(),
                      DeliveringOrderView(),
                      SuccessfulOrderView(),
                      CancledOrderView(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
