import 'package:coffee_kst/app/screens/home/domain/entities/product.dart';
import 'package:coffee_kst/main_export.dart';

class ItemBestSeller extends StatelessWidget {
  const ItemBestSeller({Key? key, required this.entity}) : super(key: key);
  final ProductEntity entity;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightColor,
      shape: const RoundedRectangleBorder(
        borderRadius: AppStyles.borderRadius12,
      ),
      child: SizedBox(
        width: 170.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16.0 / 12.0,
                    child: ImageWidget(
                      url: entity.imageUrl,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  TextWidgets(
                    text: entity.name,
                    fontSize: AppDimens.text16,
                    textColor: Theme.of(context).textTheme.bodyMedium!.color!,
                  ),
                  const SizedBox(height: 5.0),
                  TextWidgets(
                    text: Convert.instance.convertVND((entity.price1)),
                    fontSize: AppDimens.text14,
                    textColor: AppColors.textErrorColor,
                  ),
                  const SizedBox(height: 5.0),
                  TextWidgets(
                    text: 'Loại: ${entity.categName}',
                    fontSize: AppDimens.text12,
                    textColor: AppColors.disableTextColor,
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidgets(
                        text: 'Đánh giá:',
                        fontSize: AppDimens.text10,
                        textColor: AppColors.disableTextColor,
                      ),
                      const Spacer(),
                      ItemStar(star: '${(entity.countRating)}'),
                    ],
                  )
                ],
              ),
              const Align(
                alignment: Alignment.topRight,
                child: Banner(
                  message: 'Hot',
                  location: BannerLocation.topEnd,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
