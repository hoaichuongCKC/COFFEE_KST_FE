import 'package:coffee_kst/app/screens/home/presentation/widgets/title_home.dart';
import 'package:coffee_kst/main_export.dart';

class BestSellerHome extends StatelessWidget {
  const BestSellerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TitleHomeWidget(
            label: 'Sản phẩm bán chạy',
            onTrailing: () {},
          ),
        ),
        const SizedBox(height: 8.0),
        LimitedBox(
          maxHeight: 250.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                color: AppColors.lightColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: AppStyles.borderRadius12,
                ),
                child: SizedBox(
                  width: 170.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 16.0 / 12.0,
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://salt.tikicdn.com/cache/w1200/ts/product/f5/37/e6/d675c1cc4992841067e018a7d0b086dc.jpg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        TextWidgets(
                          text: 'Cà phê sữa',
                          fontSize: AppDimens.text14,
                          textColor:
                              Theme.of(context).textTheme.bodyMedium!.color!,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
