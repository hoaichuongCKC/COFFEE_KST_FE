import 'package:coffee_kst/main_export.dart';

class SelectBoxWidget extends StatelessWidget {
  const SelectBoxWidget(
      {super.key, required this.value, required this.onClicked});
  final String value;
  final Function() onClicked;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: AppColors.lightColor.withAlpha(230),
            borderRadius: AppStyles.borderRadius12,
            border: Theme.of(context).brightness == Brightness.light
                ? Border.all(color: AppColors.primaryColor, width: 0.5)
                : null),
        constraints: const BoxConstraints(
          minWidth: double.infinity,
          maxHeight: 50.0,
          minHeight: 45.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextWidgets(
                text: value,
                fontSize: AppDimens.text14,
                maxline: 1,
                textColor: AppColors.disableTextColor,
              ),
            ),
            SvgPicture.asset(AppIcons.ARROW_DOWN_ASSET)
          ],
        ),
      ),
    );
  }
}
