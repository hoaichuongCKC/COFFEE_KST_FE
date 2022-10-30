import 'package:coffee_kst/database/box/information_user.dart';
import 'package:coffee_kst/database/hive/infor_user/infor_user.dart';
import 'package:coffee_kst/main_export.dart';

class AvatarUserSmall extends StatelessWidget {
  const AvatarUserSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 45.0,
        minHeight: 45.0,
      ),
      decoration: const ShapeDecoration(
        shape: CircleBorder(),
        color: AppColors.borderAvatarColor,
      ),
      alignment: Alignment.center,
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: ValueListenableBuilder<Box<InformationUserHive>>(
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
