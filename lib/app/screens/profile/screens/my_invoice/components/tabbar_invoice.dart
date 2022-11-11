import 'package:coffee_kst/main_export.dart';

class TabbarInvoice extends StatelessWidget {
  TabbarInvoice({super.key, required this.controller});
  final TabController controller;
  final List<String> listTabbarInvoice = [
    'Đơn mới',
    'Đã xác nhận',
    'Đang giao hàng',
    'Hoàn thành',
    'Đã huỷ'
  ];
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 50.0,
      child: TabBar(
        controller: controller,
        indicatorColor: AppColors.primaryColor,
        indicatorWeight: 2.5,
        labelColor: AppColors.primaryColor,
        unselectedLabelColor: AppColors.darkColor,
        isScrollable: true,
        splashBorderRadius: AppStyles.borderRadius5,
        tabs: listTabbarInvoice.map((e) {
          return Tab(
            text: e,
            height: 50.0,
          );
        }).toList(),
      ),
    );
  }
}
