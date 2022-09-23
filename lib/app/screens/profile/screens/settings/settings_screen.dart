import 'package:coffee_kst/app/common/widgets/appbar_widget.dart';
import 'package:coffee_kst/app/screens/profile/screens/settings/components/background_app.dart';
import 'package:coffee_kst/app/screens/profile/screens/settings/components/language_setting.dart';
import 'package:coffee_kst/core/locale_keys.g.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: LocaleKeys.settings.tr(), context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            LanguageSetting(),
            SizedBox(
              height: 20.0,
            ),
            BackgroundAppSettings(),
          ],
        ),
      ),
    );
  }
}
