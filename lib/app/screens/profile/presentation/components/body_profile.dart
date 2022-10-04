import 'package:coffee_kst/app/common/animations/do_fade/fade_in_right.dart';
import 'package:coffee_kst/app/common/dialog/dialog_controller.dart';
import 'package:coffee_kst/core/utils/constants_profile.dart';
import 'package:coffee_kst/database/box/box_user.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:coffee_kst/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';

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
  },
  {
    'icon': SvgPicture.asset(AppIcons.LOGOUT_ASSET),
    'label': ITEM_LOGOUT,
  }
];

class BodyProfile extends StatelessWidget {
  const BodyProfile({
    Key? key,
  }) : super(key: key);

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
        AppRoutes.pushNamed(INFORMATION_PATH_PROFILE);
        break;
      case ITEM_CHANGE_PASSWORD:
        AppRoutes.pushNamed(CHANGE_PASSWORD_PATH_PROFILE);
        break;
      case ITEM_SETTINGS:
        AppRoutes.pushNamed(SETTING_PATH_PROFILE);
        break;
      case ITEM_LOGOUT:
        DialogController.instance.warning(
          message: 'Bạn có chắc đăng xuất chứ?',
          context: context,
          nameCancle: 'Huỷ',
          nameConfirm: 'Thoát',
          onConfirm: () {
            BoxesUser.instance.deleteTokenUser();
            AppRoutes.pushNameAndRemoveUntil(LOGIN_PATH);
          },
          onCancle: () => Navigator.pop(context),
        );

        break;
      default:
    }
  }

  Widget _buildItemProfile(
      BuildContext context, Widget icon, String label, int index) {
    bool isLight = (Theme.of(context).brightness == Brightness.light);

    return FadeInRight(
      delay: Duration(milliseconds: 100 * index),
      duration: const Duration(milliseconds: 300),
      child: ClipPath(
        clipper: isLight ? null : DrawItemProfile(),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
            color: AppColors.lightColor,
            border: isLight
                ? Border(
                    bottom: BorderSide(
                        color: AppColors.disableTextColor.withAlpha(200),
                        width: 0.2))
                : null,
          ),
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
                  text: label.tr(),
                  fontSize: AppDimens.text14,
                  textColor: Theme.of(context).textTheme.titleSmall!.color!,
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
