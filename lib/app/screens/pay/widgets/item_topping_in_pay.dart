import 'package:coffee_kst/app/screens/cart/domain/entities/cart.dart';
import 'package:coffee_kst/main_export.dart';

class ItemToppingInPay extends StatelessWidget {
  const ItemToppingInPay({super.key, required this.listDataa});
  final List<ToppingEntity> listDataa;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listDataa.map((e) {
        final index = listDataa.indexOf(e);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LimitedBox(
              maxHeight: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: AppStyles.borderRadius5,
                    child: AspectRatio(
                      aspectRatio: 16 / 13,
                      child: ImageWidget(
                        url: e.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidgets(
                              text: e.name,
                              fontSize: AppDimens.text12,
                              textColor: AppColors.darkColor,
                            ),
                            TextWidgets(
                              text: 'x${e.quantity}',
                              fontSize: AppDimens.text12,
                              textColor: AppColors.disableTextColor,
                            ),
                          ],
                        ),
                        TextWidgets(
                          text: Convert.instance.convertVND(e.price),
                          fontSize: AppDimens.text12,
                          textColor: AppColors.textErrorColor,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            index == listDataa.length - 1
                ? const SizedBox()
                : const SizedBox(height: 8.0),
          ],
        );
      }).toList(),
    );
  }
}
