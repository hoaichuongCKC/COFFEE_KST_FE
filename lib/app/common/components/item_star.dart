import 'package:coffee_kst/main_export.dart';

class ItemStar extends StatelessWidget {
  const ItemStar({Key? key, required this.star}) : super(key: key);
  final String star;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.darkColor,
      shape: const RoundedRectangleBorder(
        borderRadius: AppStyles.borderRadius10,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidgets(
              text: star,
              fontSize: AppDimens.text10,
              textColor: AppColors.lightColor,
            ),
            SvgPicture.asset(
              AppIcons.STAR_ASSET,
              width: 14.0,
              height: 14.0,
            ),
          ],
        ),
      ),
    );
  }
}
