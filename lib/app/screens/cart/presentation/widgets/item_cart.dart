import 'package:coffee_kst/app/common/widgets/counter_widget.dart';
import 'package:coffee_kst/app/screens/cart/domain/entities/cart.dart';
import 'package:coffee_kst/main_export.dart';

class ItemCart extends StatelessWidget {
  const ItemCart(
      {Key? key,
      required this.onClear,
      required this.entity,
      required this.animation})
      : super(key: key);
  final VoidCallback onClear;
  final CartEntity entity;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      key: ValueKey(entity.id),
      position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
          .animate(CurvedAnimation(parent: animation, curve: Curves.easeIn)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: const BoxDecoration(
          color: AppColors.lightColor,
          borderRadius: AppStyles.borderRadius10,
        ),
        padding: const EdgeInsets.only(right: 10.0, left: 10, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              constraints: const BoxConstraints(
                minHeight: 80.0,
                maxHeight: 100.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageWidget(
                    url: entity.productInfor.imageUrl,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 15.0),
                  // const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextWidgets(
                              text: entity.productInfor.name,
                              fontSize: AppDimens.text16,
                              textColor: AppColors.darkColor,
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: onClear,
                              child: const Icon(
                                Icons.clear,
                                size: 20.0,
                                color: AppColors.disableTextColor,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidgets(
                              text: Convert.instance.convertVND(entity.price),
                              fontSize: AppDimens.text14,
                              textColor: AppColors.textErrorColor,
                            ),
                            TextWidgets(
                              text: 'Loại: ${entity.sizeName}',
                              fontSize: AppDimens.text14,
                              textColor: AppColors.disableTextColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CounterWidget(
                                decrement: () {},
                                increment: () {},
                                currentCounter: TextWidgets(
                                  text: entity.quantity.toString(),
                                  fontSize: AppDimens.text14,
                                  textColor: AppColors.darkColor,
                                )),
                            const Spacer(),
                            TextWidgets(
                              text: 'Loại: ${entity.productInfor.categName}',
                              fontSize: AppDimens.text14,
                              textColor: AppColors.disableTextColor,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            entity.productInfor.listToppings.isEmpty
                ? const SizedBox()
                : const Divider(),
            entity.productInfor.listToppings.isEmpty
                ? const SizedBox()
                : TextWidgets(
                    text: 'Danh sách topping:',
                    fontSize: AppDimens.text14,
                    textColor: AppColors.disableTextColor,
                  ),
            entity.productInfor.listToppings.isEmpty
                ? const SizedBox()
                : const SizedBox(height: 5.0),
            entity.productInfor.listToppings.isEmpty
                ? const SizedBox()
                : ListTopping(entity: entity)
          ],
        ),
      ),
    );
  }
}

class ListTopping extends StatelessWidget {
  const ListTopping({
    Key? key,
    required this.entity,
  }) : super(key: key);

  final CartEntity entity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: entity.productInfor.listToppings.map((e) {
        final index = entity.productInfor.listToppings.indexOf(e);
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
                            CounterWidget(
                              decrement: () {},
                              increment: () {},
                              currentCounter: TextWidgets(
                                text: e.quantity.toString(),
                                fontSize: AppDimens.text14,
                                textColor: AppColors.darkColor,
                              ),
                            )
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
            index == entity.productInfor.listToppings.length - 1
                ? const SizedBox()
                : const SizedBox(height: 8.0),
          ],
        );
      }).toList(),
    );
  }
}
