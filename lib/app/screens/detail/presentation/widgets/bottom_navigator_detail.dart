import 'package:coffee_kst/app/common/widgets/counter_widget.dart';
import 'package:coffee_kst/main_export.dart';

class BottomNavigatorDetail extends StatelessWidget {
  const BottomNavigatorDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CounterWidget(
            decrement: () {},
            increment: () {},
            currentCounter: '1',
          ),
          const SizedBox(height: 7.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidgets(
                text: 'Tổng tiền:',
                fontSize: AppDimens.text16,
                textColor: AppColors.disableTextColor,
              ),
              TextWidgets(
                text: '14.000đ',
                fontSize: AppDimens.text16,
                textColor: AppColors.textErrorColor,
              )
            ],
          ),
          const SizedBox(height: 10.0),
          ButtonWidget(
            label: 'Thêm giỏ hàng',
            onClicked: () {},
            height: 35.0,
          )
        ],
      ),
    );
  }
}
