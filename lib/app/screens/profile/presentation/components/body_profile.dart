import 'package:coffee_kst/app/common/animations/do_fade/fade_in_right.dart';
import 'package:coffee_kst/app/screens/profile/domain/entities/user.dart';
import 'package:coffee_kst/core/utils/constants_profile.dart';
import 'package:coffee_kst/main_export.dart';

List<Map<String, dynamic>> listProfile = [
  {
    'icon': SvgPicture.asset(AppIcons.USER_ASSET),
    'label': ITEM_INFORMATION,
  },
  {
    'icon': SvgPicture.asset(AppIcons.LOCK_ASSET),
    'label': ITEM_CHANGE_PASSWORD,
  },
  {
    'icon': SvgPicture.asset(AppIcons.FAVORITE_ASSET),
    'label': ITEM_FAVORITE_PRODUCT,
  },
  {
    'icon': SvgPicture.asset(AppIcons.INVOICE_ASSET),
    'label': ITEM_MY_INVOICE,
  },
  {
    'icon': SvgPicture.asset(AppIcons.SETTING_ASSET),
    'label': ITEM_SETTINGS,
  }
];

class BodyProfile extends StatelessWidget {
  const BodyProfile({
    Key? key,
    required this.userEntity,
  }) : super(key: key);
  final UserEntity userEntity;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: listProfile.map(
            (e) {
              final index = listProfile.indexOf(e);
              return Column(
                children: [
                  GestureDetector(
                    onTap: () => _handleScreenSwitching(e['label'], context),
                    child: _buildItemProfile(
                        context, e['icon'], e['label'], index),
                  ),
                  const SizedBox(height: 15.0),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  _handleScreenSwitching(String label, BuildContext context) {
    switch (label) {
      case ITEM_INFORMATION:
        context.goNamed('personal_information', extra: userEntity);
        break;
      case ITEM_CHANGE_PASSWORD:
        context.goNamed('change_password');
        break;
      default:
    }
  }

  Widget _buildItemProfile(
      BuildContext context, Widget icon, String label, int index) {
    return FadeInRight(
      delay: Duration(milliseconds: 300 * index),
      child: ClipPath(
        clipper: DrawItemProfile(),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          height: MediaQuery.of(context).size.height * 0.08,
          color: AppColors.lightColor,
          constraints: const BoxConstraints(
            minHeight: 50.0,
            maxHeight: 60.0,
            minWidth: 50.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 8.0),
              Expanded(
                child: TextWidgets(
                  text: label,
                  fontSize: AppDimens.text14,
                  textColor: AppColors.darkColor,
                ),
              ),
              SvgPicture.asset(AppIcons.ARROW_RIGHT_ASSET),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawItemProfile extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.moveTo(0.0, size.height / 2);
    path.lineTo(size.width * 0.05, size.height * 0.1);
    path.quadraticBezierTo(size.width * 0.06, 0.0, size.width * 0.1, 0.0);
    path.lineTo(size.width * 0.93, 0.0);
    path.quadraticBezierTo(
        size.width * 0.94, 0.0, size.width * 0.96, size.height * 0.1);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width * 0.96, size.height * 0.9);
    path.quadraticBezierTo(
        size.width * 0.95, size.height, size.width * 0.92, size.height);
    path.lineTo(size.width * 0.08, size.height);
    path.quadraticBezierTo(
        size.width * 0.07, size.height, size.width * 0.05, size.height * 0.9);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
