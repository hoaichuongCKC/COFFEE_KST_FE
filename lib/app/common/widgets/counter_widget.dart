import 'package:coffee_kst/main_export.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget(
      {Key? key,
      required this.decrement,
      required this.increment,
      this.currentCounter = '0'})
      : super(key: key);
  final Function() decrement;
  final Function() increment;
  final String currentCounter;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: decrement,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.disableTextColor.withAlpha(100),
              borderRadius: AppStyles.borderRadius5,
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.remove,
              size: AppDimens.icon15,
              color: AppColors.lightColor,
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        TextWidgets(
          text: currentCounter,
          fontSize: AppDimens.text14,
          textColor: AppColors.darkColor,
        ),
        const SizedBox(width: 10.0),
        GestureDetector(
          onTap: increment,
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: AppStyles.borderRadius5,
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.add,
              size: AppDimens.icon18,
              color: AppColors.lightColor,
            ),
          ),
        ),
      ],
    );
  }
}
