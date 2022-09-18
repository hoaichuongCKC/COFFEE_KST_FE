import 'package:coffee_kst/app/common/animations/do_fade/fade_in.dart';
import 'package:coffee_kst/app/common/animations/do_fade/fade_in_right.dart';
import 'package:coffee_kst/app/screens/profile/domain/entities/user.dart';
import 'package:coffee_kst/main_export.dart';

class BodyPersonalInformation extends StatelessWidget {
  const BodyPersonalInformation({Key? key, required this.userEntity})
      : super(key: key);
  final UserEntity userEntity;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildItemWidget(
          size,
          'Họ tên',
          userEntity.fullname,
          const Duration(milliseconds: 300),
          false,
        ),
        const SizedBox(height: 15.0),
        _buildItemWidget(
          size,
          'Số điện thoại',
          userEntity.phone,
          const Duration(milliseconds: 400),
          true,
        ),
        const SizedBox(height: 15.0),
        _buildItemWidget(
          size,
          'Địa chỉ',
          userEntity.fullAddress,
          const Duration(milliseconds: 600),
          false,
        ),
        const SizedBox(height: 15.0),
        _buildItemWidget(
          size,
          'Giới tính',
          userEntity.gender,
          const Duration(milliseconds: 800),
          true,
        ),
      ],
    );
  }

  Widget _buildItemWidget(
      Size size, String label, String valueItem, Duration delay, bool isRight) {
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
                    text: label,
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
                        child: _buildItemContainerValue(size, valueItem),
                      ),
                    )
                  : FadeInLeft(
                      delay: delay,
                      child: ClipPath(
                        clipper: DrawItemPI(isRight),
                        child: _buildItemContainerValue(size, valueItem),
                      ),
                    ),
            ],
          ),
        ),
        isRight ? const SizedBox() : const Spacer(),
      ],
    );
  }

  Container _buildItemContainerValue(Size size, String valueItem) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      alignment: Alignment.center,
      color: AppColors.primaryColor,
      child: TextWidgets(
        text: valueItem,
        fontSize: AppDimens.text14,
        maxline: 3,
      ),
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
