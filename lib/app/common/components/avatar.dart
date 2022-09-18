import 'package:coffee_kst/main_export.dart';

class AvatarUser extends StatelessWidget {
  const AvatarUser({Key? key, this.isIconCamera = false}) : super(key: key);
  final bool isIconCamera;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.all(8.0),
      constraints: const BoxConstraints(
        minWidth: 90.0,
        minHeight: 90.0,
      ),
      decoration: const ShapeDecoration(
        shape: CircleBorder(),
        color: AppColors.borderAvatarColor,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              'https://i.pinimg.com/736x/6d/52/ea/6d52ea3bc699885f73b0025e40f55ee1.jpg',
            ),
          ),
          isIconCamera ? _buildIconCamera() : const SizedBox(),
        ],
      ),
    );
  }

  Align _buildIconCamera() {
    return Align(
      alignment: Alignment.bottomRight,
      child: CircleAvatar(
        radius: 15.0,
        backgroundColor: AppColors.lightColor,
        child: SvgPicture.asset(
          AppIcons.CAMERA_ASSET,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
