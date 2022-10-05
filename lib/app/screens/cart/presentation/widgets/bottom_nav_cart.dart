import 'package:coffee_kst/main_export.dart';

class BottomNavCart extends StatelessWidget {
  const BottomNavCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidgets(
                text: 'Tổng đơn:',
                textColor: AppColors.disableTextColor,
                fontSize: AppDimens.text16,
                weight: FontWeight.w600,
              ),
              const Spacer(),
              TextWidgets(
                text: '42.000đ',
                textColor: AppColors.textErrorColor,
                fontSize: AppDimens.text16,
                weight: FontWeight.w600,
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 10.0),
          ButtonWidget(label: 'Thanh toán', onClicked: () {}),
        ],
      ),
    );
  }
}
