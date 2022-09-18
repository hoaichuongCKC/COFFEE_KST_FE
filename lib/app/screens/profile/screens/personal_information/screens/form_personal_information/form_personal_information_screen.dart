import 'package:coffee_kst/core/utils/constants_profile.dart';
import 'package:coffee_kst/main_export.dart';

import 'components/form_fullname.dart';
import 'components/form_phone.dart';
import 'components/personal_gender.dart';
import 'components/select_box_address.dart';

class FormPersonalInformationScreen extends StatelessWidget {
  const FormPersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: _buildAppBar(context),
            bottomNavigationBar: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: ButtonWidget(
                label: 'Hoàn thành',
                onClicked: () {},
              ),
            ),
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    FormFullNamePI(),
                    SizedBox(height: 16.0),
                    FormPhonePI(),
                    SizedBox(height: 16.0),
                    SelectBoxAddressPI(),
                    SizedBox(height: 16.0),
                    GenderPersonalPI(),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: InkWell(
        onTap: () => context.pop(),
        child: const Icon(
          Icons.arrow_back_ios,
          size: 20.0,
          color: AppColors.lightColor,
        ),
      ),
      title: TextWidgets(
        text: SCREEN_NAME_PI,
        fontSize: AppDimens.text22,
        weight: FontWeight.w600,
      ),
    );
  }
}
