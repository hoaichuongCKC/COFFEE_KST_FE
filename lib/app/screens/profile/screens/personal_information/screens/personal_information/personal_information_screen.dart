import 'package:coffee_kst/app/common/components/avatar.dart';
import 'package:coffee_kst/app/common/widgets/appbar_widget.dart';
import 'package:coffee_kst/app/screens/profile/domain/entities/user.dart';
import 'package:coffee_kst/core/utils/constants_profile.dart';
import 'package:coffee_kst/main_export.dart';

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
    return AppBarWidget(
      title: SCREEN_NAME_PI,
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
      context: context,
    );
  }
}
