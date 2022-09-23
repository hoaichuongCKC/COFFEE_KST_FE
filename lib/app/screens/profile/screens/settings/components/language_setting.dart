// ignore_for_file: must_be_immutable

import 'package:coffee_kst/app/common/widgets/toggle_widget.dart';
import 'package:coffee_kst/core/locale_keys.g.dart';
import 'package:coffee_kst/database/box/settings.dart';
import 'package:coffee_kst/database/hive/settings/language.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageSetting extends StatelessWidget {
  const LanguageSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidgets(
              text: LocaleKeys.english.tr(),
              fontSize: AppDimens.text18,
              weight: FontWeight.w600,
              textColor: Theme.of(context).textTheme.bodyMedium!.color!,
            ),
            const SizedBox(height: 8.0),
            TextWidgets(
              text: '(${LocaleKeys.default_is_vietnamese.tr()})',
              fontSize: AppDimens.text14,
              textColor: AppColors.disableTextColor,
            )
          ],
        ),
        const Spacer(),
        ValueListenableBuilder<Box<LanguageHive>>(
          builder: (context, Box<LanguageHive> box, child) {
            return ToggleWidget(
              onChanged: (ToggleSwitch value) async {
                if (value == ToggleSwitch.TURN_OFF) {
                  await context.setLocale(const Locale('en', 'US'));
                  box.put(KEY_BOX_LANGUAGE,
                      LanguageHive(isLanguageVietNamese: false));
                } else {
                  await context.setLocale(const Locale('vi', 'VN'));
                  box.put(KEY_BOX_LANGUAGE,
                      LanguageHive(isLanguageVietNamese: true));
                }
              },
              currentValue: box.get(KEY_BOX_LANGUAGE)!.isLanguageVietNamese
                  ? ToggleSwitch.TURN_OFF
                  : ToggleSwitch.TURN_ON,
            );
          },
          valueListenable:
              Hive.box<LanguageHive>(NAME_BOX_LANGUAGE).listenable(),
        )
      ],
    );
  }
}
