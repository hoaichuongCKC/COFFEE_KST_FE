import 'package:coffee_kst/main_export.dart';

class DialogWarning extends StatelessWidget {
  const DialogWarning({
    Key? key,
    required this.onConfirm,
    required this.message,
    required this.onCancel,
  }) : super(key: key);
  final String message;
  final Function() onConfirm;
  final Function() onCancel;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidgets(
              text: message,
              fontSize: AppDimens.text14,
              textColor: AppColors.darkColor,
              weight: FontWeight.w400,
              textAlign: TextAlign.left,
              maxline: 3,
            ),
            const SizedBox(height: 8.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Spacer(),
                GestureDetector(
                  onTap: onConfirm,
                  child: TextWidgets(
                    text: 'Đồng ý',
                    fontSize: AppDimens.text14,
                    textColor: AppColors.primaryColor,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onCancel,
                  child: TextWidgets(
                    text: 'Quay lại',
                    fontSize: AppDimens.text14,
                    textColor: AppColors.disableTextColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
