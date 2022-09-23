import 'package:coffee_kst/app/common/components/avatar.dart';
import 'package:coffee_kst/app/common/widgets/appbar_widget.dart';
import 'package:coffee_kst/core/locale_keys.g.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:easy_localization/easy_localization.dart';

import 'components/body_information.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: LocaleKeys.personal_information.tr(),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: InkWell(
              onTap: () => context.goNamed('edit_personal_information'),
              child: Icon(
                Icons.edit,
                size: 20.0,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          )
        ],
        context: context,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Center(
            child: AvatarUser(
              isIconCamera: true,
            ),
          ),
          SizedBox(height: 25.0),
          BodyPersonalInformation(),
        ],
      ),
    );
  }
}
