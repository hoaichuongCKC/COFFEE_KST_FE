import 'package:coffee_kst/app/common/components/avatar.dart';
import 'package:coffee_kst/app/screens/profile/domain/entities/user.dart';
import 'package:coffee_kst/app/screens/profile/presentation/bloc/personal_information_bloc.dart';
import 'package:coffee_kst/core/utils/constants_profile.dart';
import 'package:coffee_kst/injection_container.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'components/body_information.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({Key? key, required this.userEntity})
      : super(key: key);
  final UserEntity userEntity;
  @override
  Widget build(BuildContext context) {
    // final loading = SpinKitFadingCircle(
    //   itemBuilder: (BuildContext context, int index) {
    //     return DecoratedBox(
    //       decoration: ShapeDecoration(
    //         color: index.isEven ? AppColors.lightColor : AppColors.primaryColor,
    //         shape: const CircleBorder(),
    //       ),
    //     );
    //   },
    // );
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Builder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: AvatarUser(
                isIconCamera: true,
              ),
            ),
            const SizedBox(height: 25.0),
            BodyPersonalInformation(userEntity: userEntity),
          ],
        );
      }),
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
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: InkWell(
            onTap: () => context.goNamed('form_personal_information'),
            child: const Icon(
              Icons.edit,
              size: 20.0,
              color: AppColors.lightColor,
            ),
          ),
        )
      ],
    );
  }
}
