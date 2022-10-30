import 'package:coffee_kst/app/common/widgets/counter_widget.dart';
import 'package:coffee_kst/app/screens/cart/domain/entities/cart.dart';
import 'package:coffee_kst/app/screens/cart/presentation/bloc/bloc_cart/cart_bloc.dart';
import 'package:coffee_kst/main_export.dart';

class ItemCart extends StatelessWidget {
  const ItemCart(
      {Key? key,
      required this.onClear,
      required this.entity,
      required this.animation,
      required this.index})
      : super(key: key);
  final VoidCallback onClear;
  final CartEntity entity;
  final int index;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      key: ValueKey(entity.imageUrl),
      position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
          .animate(CurvedAnimation(parent: animation, curve: Curves.easeIn)),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.lightColor,
          borderRadius: AppStyles.borderRadius10,
        ),
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * 0.9,
          maxWidth: MediaQuery.of(context).size.width * 0.95,
        ),
        padding:
            const EdgeInsets.only(right: 8.0, left: 8, bottom: 10.0, top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              constraints: const BoxConstraints(
                minHeight: 80.0,
                maxHeight: 100.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 14,
                    child: ClipRRect(
                      borderRadius: AppStyles.borderRadius10,
                      child: ImageWidget(
                        url: entity.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  // const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextWidgets(
                                text: entity.name,
                                fontSize: AppDimens.text14,
                                textColor: AppColors.darkColor,
                                weight: FontWeight.w500,
                                maxline: 2,
                              ),
                            ),
                            GestureDetector(
                              onTap: onClear,
                              child: SvgPicture.asset(
                                AppIcons.TRASH_ASSET,
                                color: AppColors.textErrorColor,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidgets(
                              text:
                                  'Giá: ${Convert.instance.convertVND(int.parse(entity.price))}',
                              fontSize: AppDimens.text12,
                              textColor: AppColors.textErrorColor,
                            ),
                            entity.sizeName != null
                                ? TextWidgets(
                                    text: 'size: ${entity.sizeName}',
                                    fontSize: AppDimens.text12,
                                    textColor: AppColors.disableTextColor,
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CounterWidget(
                              decrement: () => context
                                  .read<CartServiceBloc>()
                                  .add(DecrementProductEvent(
                                      productIndex: index)),
                              increment: () => context
                                  .read<CartServiceBloc>()
                                  .add(IncrementProductEvent(
                                      productIndex: index)),
                              currentCounter: TextWidgets(
                                text: entity.quantity.toString(),
                                fontSize: AppDimens.text12,
                                textColor: AppColors.darkColor,
                              ),
                            ),
                            const Spacer(),
                            TextWidgets(
                              text: 'Loại: ${entity.categName}',
                              fontSize: AppDimens.text12,
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
            entity.listTopping.isEmpty ? const SizedBox() : const Divider(),
            entity.listTopping.isEmpty
                ? const SizedBox()
                : TextWidgets(
                    text: 'Danh sách topping:',
                    fontSize: AppDimens.text14,
                    textColor: AppColors.disableTextColor,
                  ),
            entity.listTopping.isEmpty
                ? const SizedBox()
                : const SizedBox(height: 10.0),
            entity.listTopping.isEmpty
                ? const SizedBox()
                : ListTopping(
                    entity: entity,
                    productIndex: index,
                  )
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
    required this.productIndex,
  }) : super(key: key);

  final CartEntity entity;
  final int productIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: entity.listTopping.map((e) {
        final index = entity.listTopping.indexOf(e);
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
                              decrement: () => context
                                  .read<CartServiceBloc>()
                                  .add(DecrementToppingEvent(
                                    productIndex: productIndex,
                                    index: index,
                                  )),
                              increment: () => context
                                  .read<CartServiceBloc>()
                                  .add(IncrementToppingEvent(
                                    productIndex: productIndex,
                                    index: index,
                                  )),
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
            index == entity.listTopping.length - 1
                ? const SizedBox()
                : const SizedBox(height: 8.0),
          ],
        );
      }).toList(),
    );
  }
}
