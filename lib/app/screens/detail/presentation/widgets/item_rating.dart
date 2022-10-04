import 'package:coffee_kst/app/common/components/avatar_small.dart';
import 'package:coffee_kst/app/screens/detail/domain/entities/review.dart';
import 'package:coffee_kst/main_export.dart';

class ItemRatingDetail extends StatelessWidget {
  const ItemRatingDetail({Key? key, required this.enity}) : super(key: key);
  final ReviewEntity enity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AvatarUserSmall(),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidgets(
                    text: enity.fullname,
                    fontSize: AppDimens.text14,
                    textColor: AppColors.disableTextColor,
                  ),
                  const SizedBox(height: 5.0),
                  TextWidgets(
                    text: enity.postedDate,
                    fontSize: AppDimens.text12,
                    textColor: AppColors.disableTextColor,
                  ),
                ],
              ),
            ),
            ItemStar(star: enity.ratingStar.toString())
          ],
        ),
        const SizedBox(height: 15.0),
        TextWidgets(
          text: enity.content,
          fontSize: AppDimens.text14,
          textColor: AppColors.darkColor,
          maxline: 5,
        )
      ],
    );
  }
}
