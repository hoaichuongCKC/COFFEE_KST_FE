import 'package:coffee_kst/main_export.dart';

class ItemInforInvoice extends StatelessWidget {
  const ItemInforInvoice({
    super.key,
    required this.label,
    required this.text,
    this.colorLabel = AppColors.darkColor,
    this.weightLabel = FontWeight.w400,
    this.colorText = AppColors.disableTextColor,
    this.weightText = FontWeight.w400,
  });
  final String label;
  final String text;
  final Color colorLabel;
  final FontWeight weightLabel;
  final Color colorText;
  final FontWeight weightText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidgets(
          text: label,
          fontSize: AppDimens.text14,
          textColor: colorLabel,
          weight: weightLabel,
        ),
        TextWidgets(
          text: text,
          fontSize: AppDimens.text14,
          textColor: colorText,
          weight: weightText,
        ),
      ],
    );
  }
}
