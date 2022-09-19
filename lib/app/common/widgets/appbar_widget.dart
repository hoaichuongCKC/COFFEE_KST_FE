import 'package:coffee_kst/main_export.dart';

class AppBarWidget extends AppBar {
  AppBarWidget({
    Key? key,
    required String title,
    required BuildContext context,
    List<Widget>? actions,
  }) : super(
          key: key,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 20.0,
              color: AppColors.lightColor,
            ),
          ),
          title: TextWidgets(
            text: title,
            fontSize: AppDimens.text22,
            weight: FontWeight.w600,
          ),
          actions: actions,
        );
}
