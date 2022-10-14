// ignore_for_file: must_be_immutable

import 'package:coffee_kst/app/common/widgets/counter_widget.dart';
import 'package:coffee_kst/app/screens/detail/domain/entities/topping.dart';
import 'package:coffee_kst/app/screens/detail/presentation/bloc/detail_service/product_detail_bloc.dart';
import 'package:coffee_kst/main_export.dart';

class ItemToppingDetail extends StatelessWidget {
  ItemToppingDetail({
    Key? key,
    required this.toppingEntity,
  }) : super(key: key);
  final ToppingEntity toppingEntity;

  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 50.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 16 / 10.0,
            child: ClipRRect(
              borderRadius: AppStyles.borderRadius12,
              child: ImageWidget(
                url: toppingEntity.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidgets(
                  text: toppingEntity.name,
                  fontSize: AppDimens.text14,
                  maxline: 2,
                  textColor: AppColors.disableTextColor,
                ),
                const SizedBox(height: 5.0),
                TextWidgets(
                  text: Convert.instance.convertVND(toppingEntity.price),
                  fontSize: AppDimens.text12,
                  textColor: AppColors.textErrorColor,
                ),
              ],
            ),
          ),
          StatefulBuilder(builder: (contex, setState) {
            return CounterWidget(
              decrement: () {
                if (quantity > 0) {
                  setState(() {
                    quantity--;
                    context.read<ProductDetaiServicelBloc>().add(
                        RemoveElementToppingEvent(toppingId: toppingEntity.id));
                  });
                }
              },
              increment: () {
                setState(() {
                  quantity++;
                  context
                      .read<ProductDetaiServicelBloc>()
                      .add(AddElementToppingEvent(
                        toppingParams: ToppingParams(
                            id: toppingEntity.id,
                            quantity: 1,
                            price: toppingEntity.price),
                      ));
                });
              },
              currentCounter: TextWidgets(
                text: quantity.toString(),
                fontSize: AppDimens.text14,
                textColor: AppColors.darkColor,
              ),
            );
          }),
        ],
      ),
    );
  }
}
