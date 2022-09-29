import 'package:coffee_kst/main_export.dart';

class ItemBestSeller extends StatelessWidget {
  const ItemBestSeller({Key? key}) : super(key: key);

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
                  const AspectRatio(
                    aspectRatio: 16.0 / 12.0,
                    child: ImageWidget(
                      url:
                          'https://salt.tikicdn.com/cache/w1200/ts/product/f5/37/e6/d675c1cc4992841067e018a7d0b086dc.jpg',
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  TextWidgets(
                    text: 'Cà phê sữa',
                    fontSize: AppDimens.text16,
                    textColor: Theme.of(context).textTheme.bodyMedium!.color!,
                  ),
                  const SizedBox(height: 5.0),
                  TextWidgets(
                    text: '14.000đ',
                    fontSize: AppDimens.text14,
                    textColor: AppColors.textErrorColor,
                  ),
                  const SizedBox(height: 5.0),
                  TextWidgets(
                    text: 'Loại: COFFEE',
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
                      const ItemStar(star: '4'),
                    ],
                  )
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  AppIcons.FAVORITE_ASSET,
                  color: AppColors.indicatorColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
