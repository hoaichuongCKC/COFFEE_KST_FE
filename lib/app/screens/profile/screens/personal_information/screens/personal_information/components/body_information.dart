import 'package:coffee_kst/app/common/animations/do_fade/fade_in.dart';
import 'package:coffee_kst/app/common/animations/do_fade/fade_in_right.dart';
import 'package:coffee_kst/core/locale_keys.g.dart';
import 'package:coffee_kst/core/utils/constants_profile.dart';
import 'package:coffee_kst/database/box/information_user.dart';
import 'package:coffee_kst/database/hive/infor_user/infor_user.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:easy_localization/easy_localization.dart';

class BodyPersonalInformation extends StatelessWidget {
  const BodyPersonalInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<InformationUserHive>>(
      valueListenable:
          Hive.box<InformationUserHive>(NAME_BOX_INFORMATION).listenable(),
      builder: (context, Box<InformationUserHive> box, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BuildItemWidget(
              lable: LocaleKeys.fullname.tr(),
              value: box.get(KEY_BOX_INFORMATION)!.fullname,
              delay: const Duration(milliseconds: 300),
              isRight: false,
            ),
            const SizedBox(height: 15.0),
            BuildItemWidget(
              lable: LocaleKeys.phone.tr(),
              value: box.get(KEY_BOX_INFORMATION)!.phone,
              delay: const Duration(milliseconds: 400),
              isRight: true,
            ),
            const SizedBox(height: 15.0),
            BuildItemWidget(
              lable: LocaleKeys.address.tr(),
              value: box.get(KEY_BOX_INFORMATION)!.full_address,
              delay: const Duration(milliseconds: 600),
              isRight: false,
            ),
            const SizedBox(height: 15.0),
            BuildItemWidget(
              lable: LocaleKeys.gender.tr(),
              value: box.get(KEY_BOX_INFORMATION)!.gender == DATA_GENDER_MALE
                  ? MALE_NAME.tr()
                  : box.get(KEY_BOX_INFORMATION)!.gender == DATA_GENDER_FEMALE
                      ? FEMALE_NAME.tr()
                      : ANOTHER_NAME.tr(),
              delay: const Duration(milliseconds: 800),
              isRight: true,
            ),
          ],
        );
      },
    );
  }
}

class BuildItemWidget extends StatelessWidget {
  const BuildItemWidget({
    Key? key,
    required this.isRight,
    required this.delay,
    required this.lable,
    required this.value,
  }) : super(key: key);
  final bool isRight;
  final Duration delay;
  final String lable;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isRight ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        isRight ? const Spacer() : const SizedBox(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: FadeIn(
                  delay: delay,
                  child: TextWidgets(
                    text: lable,
                    fontSize: AppDimens.text18,
                    textColor: AppColors.disableTextColor,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              isRight
                  ? FadeInRight(
                      delay: delay,
                      child: ClipPath(
                        clipper: DrawItemPI(isRight),
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          alignment: Alignment.center,
                          color: AppColors.primaryColor,
                          child: TextWidgets(
                            text: value,
                            fontSize: AppDimens.text14,
                            maxline: 3,
                          ),
                        ),
                      ),
                    )
                  : FadeInLeft(
                      delay: delay,
                      child: ClipPath(
                        clipper: DrawItemPI(isRight),
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          alignment: Alignment.center,
                          color: AppColors.primaryColor,
                          child: TextWidgets(
                            text: value,
                            fontSize: AppDimens.text14,
                            maxline: 3,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
        isRight ? const SizedBox() : const Spacer(),
      ],
    );
  }
}

class DrawItemPI extends CustomClipper<Path> {
  const DrawItemPI(this.isRight);
  final bool isRight;
  @override
  Path getClip(Size size) {
    Path path = Path();
    if (isRight) {
      path.moveTo(0.0, size.height / 2);
      path.lineTo(size.width * 0.1, 0.0);
      path.lineTo(size.width, 0.0);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width * 0.1, size.height);
    } else {
      path.moveTo(0.0, 0.0);
      path.lineTo(size.width * 0.9, 0.0);
      path.lineTo(size.width, size.height / 2);
      path.lineTo(size.width * 0.9, size.height);
      path.lineTo(size.width * 0.0, size.height);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
