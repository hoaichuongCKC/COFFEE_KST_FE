import 'package:coffee_kst/app/screens/home/domain/entities/product_type.dart';
import 'package:coffee_kst/core/utils/home.dart';
import 'package:coffee_kst/main_export.dart';

class ItemCategHome extends StatelessWidget {
  const ItemCategHome({
    Key? key,
    required this.data,
    required this.index,
    required this.onClicked,
  }) : super(key: key);

  final ProductTypeEntity data;
  final int index;
  final Function() onClicked;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        key: ValueKey(data.categ_name),
        margin: EdgeInsets.only(left: 15.0, right: index == 2 ? 15.0 : 0.0),
        padding: const EdgeInsets.all(10.0),
        constraints: const BoxConstraints(
          minWidth: 110.0,
          minHeight: 60.0,
          maxHeight: 70.0,
          maxWidth: 120.0,
        ),
        decoration: BoxDecoration(
          color: data.categ_name == COFFEE_TYPE
              ? AppColors.primaryColor
              : data.categ_name == CAKE_TYPE
                  ? AppColors.cakeColor
                  : AppColors.drinkColor,
          borderRadius: AppStyles.borderRadius12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              data.categ_name == COFFEE_TYPE
                  ? AppIcons.CATEG_COFFEE_ASSET
                  : data.categ_name == CAKE_TYPE
                      ? AppIcons.CATEG_CAKE_ASSET
                      : AppIcons.CATEG_TEA_ASSET,
              color: AppColors.lightColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidgets(text: 'Loại', fontSize: AppDimens.text14),
                  TextWidgets(
                    text: data.categ_name,
                    fontSize: AppDimens.text12,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
