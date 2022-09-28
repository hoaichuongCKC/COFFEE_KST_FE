import 'package:coffee_kst/app/common/components/avatar_big.dart';
import 'package:coffee_kst/database/box/information_user.dart';
import 'package:coffee_kst/database/hive/infor_user/infor_user.dart';
import 'package:coffee_kst/main_export.dart';

class HeaderProfileWidget extends StatelessWidget {
  const HeaderProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: CustomPaint(
                  size: const Size(double.infinity, double.maxFinite),
                  painter: DrawBgHeaderProfile(),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ValueListenableBuilder<Box<InformationUserHive>>(
                valueListenable:
                    Hive.box<InformationUserHive>(NAME_BOX_INFORMATION)
                        .listenable(),
                builder: (context, Box<InformationUserHive> box, child) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const AvatarUserBig(),
                      const SizedBox(height: 8.0),
                      TextWidgets(
                        text: box.get(KEY_BOX_INFORMATION)!.fullname,
                        fontSize: AppDimens.text18,
                        weight: FontWeight.w600,
                        textColor:
                            Theme.of(context).textTheme.bodyMedium!.color!,
                      ),
                      const SizedBox(height: 8.0),
                      TextWidgets(
                        text: box.get(KEY_BOX_INFORMATION)!.phone,
                        fontSize: AppDimens.text14,
                        weight: FontWeight.w600,
                        textColor:
                            Theme.of(context).textTheme.bodyMedium!.color!,
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class DrawBgHeaderProfile extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.lineTo(0.0, size.height * 0.7);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);
    canvas.drawPath(path, paint);
    path.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
