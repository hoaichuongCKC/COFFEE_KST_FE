import 'package:coffee_kst/main_export.dart';

class AppBarWidget extends AppBar {
  AppBarWidget({
    Key? key,
    required String title,
    required BuildContext context,
    Function()? onLeading,
    List<Widget>? actions,
  }) : super(
          key: key,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
              if (onLeading != null) {
                onLeading();
              }
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 20.0,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          title: TextWidgets(
            text: title,
            fontSize: AppDimens.text20,
            weight: FontWeight.w600,
            textColor: Theme.of(context).textTheme.bodyMedium!.color!,
          ),
          actions: actions,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        );
}
