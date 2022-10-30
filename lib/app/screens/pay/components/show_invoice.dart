import 'package:coffee_kst/app/screens/cart/presentation/bloc/bloc_cart/cart_bloc.dart';
import 'package:coffee_kst/app/screens/pay/widgets/item_cart_in_pay.dart';
import 'package:coffee_kst/main_export.dart';

class ShowMyInvoice extends StatelessWidget {
  const ShowMyInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    final blocCart = BlocProvider.of<CartServiceBloc>(context).state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgets(
          text: '*Sản phẩm',
          fontSize: AppDimens.text18,
          textColor: AppColors.darkColor,
          weight: FontWeight.w500,
        ),
        const SizedBox(height: 7.0),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: blocCart.list.length,
          separatorBuilder: (context, index) =>
              index == blocCart.list.length - 1
                  ? const SizedBox()
                  : const Divider(
                      color: AppColors.cakeColor,
                    ),
          itemBuilder: (context, index) {
            return ItemCartInPay(entityCart: blocCart.list[index]);
          },
        ),
      ],
    );
  }
}
