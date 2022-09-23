import 'package:coffee_kst/app/common/widgets/checkbox_widget.dart';
import 'package:coffee_kst/core/locale_keys.g.dart';
import 'package:coffee_kst/database/box/settings.dart';
import 'package:coffee_kst/database/hive/settings/theme.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:easy_localization/easy_localization.dart';

class BackgroundAppSettings extends StatelessWidget {
  const BackgroundAppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgets(
          text: LocaleKeys.background_app.tr(),
          fontSize: AppDimens.text18,
          weight: FontWeight.w600,
          textColor: Theme.of(context).textTheme.bodyMedium!.color!,
        ),
        const SizedBox(height: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: AppStyles.borderRadius15,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2.2,
                height: 200.0,
                child: const Image(
                  image: AssetImage(
                    'assets/images/settings/background_dark.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            ValueListenableBuilder<Box<ThemeHive>>(
                valueListenable:
                    Hive.box<ThemeHive>(NAME_BOX_THEME).listenable(),
                builder: (context, Box<ThemeHive> box, child) {
                  return CheckBoxWidget(
                    onChanged: (bool value) async {
                      if (!value) {
                        box.put(KEY_BOX_THEME, ThemeHive(isDarkTheme: false));
                      } else {
                        box.put(KEY_BOX_THEME, ThemeHive(isDarkTheme: true));
                      }
                    },
                    value: box.get(KEY_BOX_THEME)!.isDarkTheme,
                  );
                }),
            const SizedBox(height: 10.0),
            TextWidgets(
              text: LocaleKeys.background_dark.tr(),
              fontSize: AppDimens.text14,
              weight: FontWeight.w400,
              textColor: Theme.of(context).textTheme.bodyMedium!.color!,
            ),
          ],
        ),
      ],
    );
  }
}
