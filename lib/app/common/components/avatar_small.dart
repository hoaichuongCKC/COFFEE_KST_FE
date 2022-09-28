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
        children: const <Widget>[
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                'https://i.pinimg.com/736x/6d/52/ea/6d52ea3bc699885f73b0025e40f55ee1.jpg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
