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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: decrement,
          child: SvgPicture.asset(AppIcons.DECREMENT_ASSET),
        ),
        const SizedBox(width: 10.0),
        TextWidgets(
          text: currentCounter,
          fontSize: AppDimens.text14,
          textColor: AppColors.primaryColor,
        ),
        const SizedBox(width: 10.0),
        GestureDetector(
          onTap: increment,
          child: SvgPicture.asset(AppIcons.INCREMENT_ASSET),
        ),
      ],
    );
  }
}
