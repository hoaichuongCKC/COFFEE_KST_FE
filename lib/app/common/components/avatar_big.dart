import 'package:coffee_kst/database/box/information_user.dart';
import 'package:coffee_kst/database/hive/infor_user/infor_user.dart';
import 'package:coffee_kst/main_export.dart';

class AvatarUserBig extends StatelessWidget {
  const AvatarUserBig(
      {Key? key, this.isIconCamera = false, required this.onClicked})
      : super(key: key);
  final bool isIconCamera;
  final Function() onClicked;
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
          ValueListenableBuilder<Box<InformationUserHive>>(
              valueListenable:
                  Hive.box<InformationUserHive>(NAME_BOX_INFORMATION)
                      .listenable(),
              builder: (context, Box<InformationUserHive> box, child) {
                final urlImage = box.get(KEY_BOX_INFORMATION)!.avatar_url;
                return CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                    urlImage ??
                        'https://i.pinimg.com/736x/6d/52/ea/6d52ea3bc699885f73b0025e40f55ee1.jpg',
                  ),
                );
              }),
          isIconCamera ? _buildIconCamera() : const SizedBox(),
        ],
      ),
    );
  }

  Align _buildIconCamera() {
    return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onTap: isIconCamera ? onClicked : null,
        child: CircleAvatar(
          radius: 15.0,
          backgroundColor: AppColors.lightColor,
          child: SvgPicture.asset(
            AppIcons.CAMERA_ASSET,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
