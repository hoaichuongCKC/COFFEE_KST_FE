import 'package:coffee_kst/main_export.dart';

class DialogFailed extends StatelessWidget {
  const DialogFailed({
    Key? key,
    required this.confirm,
    required this.onConfirm,
    required this.message,
  }) : super(key: key);
  final String message;
  final String confirm;
  final Function onConfirm;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: AppColors.lightColor.withAlpha(250),
      shape: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.lightColor, width: 0.0),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.WARNING_ASSET),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: TextWidgets(
                text: message,
                fontSize: AppDimens.text14,
                textColor: AppColors.darkColor,
                weight: FontWeight.w400,
              ),
            ),
            ButtonWidget(
              label: confirm,
              onClicked: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
