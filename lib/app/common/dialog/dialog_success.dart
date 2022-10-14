import 'dart:async';

import 'package:coffee_kst/main_export.dart';
import 'package:coffee_kst/routes/routes.dart';

class DialogSuccess extends StatelessWidget {
  const DialogSuccess({
    Key? key,
    required this.confirm,
    required this.onConfirm,
    required this.message,
  }) : super(key: key);
  final String message;
  final String confirm;
  final Function()? onConfirm;
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
            SvgPicture.asset(AppIcons.SUCCESS_ASSET),
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
              onClicked: onConfirm ?? () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}

class DialogSuccessNotAction extends StatefulWidget {
  const DialogSuccessNotAction({
    Key? key,
  }) : super(key: key);

  @override
  State<DialogSuccessNotAction> createState() => _DialogSuccessNotActionState();
}

class _DialogSuccessNotActionState extends State<DialogSuccessNotAction> {
  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 700), (timer) {
      if (timer.tick == 2) {
        AppRoutes.pop();
        timer.cancel();
      }
    });
    super.initState();
  }

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
            SvgPicture.asset(AppIcons.SUCCESS_ASSET),
            const SizedBox(height: 8.0),
            TextWidgets(
              text: 'Thêm thành công',
              fontSize: AppDimens.text14,
              textColor: AppColors.darkColor,
              weight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}
