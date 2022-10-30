import 'package:coffee_kst/app/screens/cart/domain/entities/cart.dart';
import 'package:coffee_kst/app/screens/pay/widgets/item_topping_in_pay.dart';
import 'package:coffee_kst/main_export.dart';

class ItemCartInPay extends StatelessWidget {
  const ItemCartInPay({super.key, required this.entityCart});
  final CartEntity entityCart;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LimitedBox(
          maxHeight: 60.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: AppStyles.borderRadius5,
                child: AspectRatio(
                  aspectRatio: 16 / 13,
                  child: ImageWidget(
                    url: entityCart.imageUrl,
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
                          text: entityCart.name,
                          fontSize: AppDimens.text14,
                          textColor: AppColors.darkColor,
                        ),
                        TextWidgets(
                          text: 'x${entityCart.quantity}',
                          fontSize: AppDimens.text12,
                          textColor: AppColors.disableTextColor,
                        ),
                        TextWidgets(
                          text: 'Loại: ${entityCart.categName}',
                          fontSize: AppDimens.text12,
                          textColor: AppColors.disableTextColor,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidgets(
                          text: Convert.instance
                              .convertVND(int.parse(entityCart.price)),
                          fontSize: AppDimens.text12,
                          textColor: AppColors.textErrorColor,
                        ),
                        TextWidgets(
                          text: 'size: ${entityCart.sizeName}',
                          fontSize: AppDimens.text12,
                          textColor: AppColors.disableTextColor,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        entityCart.listTopping.isEmpty
            ? const SizedBox()
            : const SizedBox(height: 7.0),
        entityCart.listTopping.isEmpty
            ? const SizedBox()
            : TextWidgets(
                text: '-> Topping:',
                fontSize: AppDimens.text14,
                textColor: AppColors.disableTextColor,
              ),
        entityCart.listTopping.isEmpty
            ? const SizedBox()
            : const SizedBox(height: 10.0),
        entityCart.listTopping.isEmpty
            ? const SizedBox()
            : ItemToppingInPay(
                listDataa: entityCart.listTopping,
              )
      ],
    );
  }
}
