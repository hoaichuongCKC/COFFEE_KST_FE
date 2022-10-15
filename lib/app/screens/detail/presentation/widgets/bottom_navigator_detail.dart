// ignore_for_file: use_build_context_synchronously

import 'package:coffee_kst/app/common/dialog/dialog_controller.dart';
import 'package:coffee_kst/app/common/widgets/counter_widget.dart';
import 'package:coffee_kst/app/screens/cart/presentation/bloc/bloc_cart/cart_bloc.dart';
import 'package:coffee_kst/app/screens/detail/presentation/bloc/detail_service/product_detail_bloc.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/navigation_bottom/navigation_screen_cubit.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:coffee_kst/routes/routes.dart';

class BottomNavigatorDetail extends StatelessWidget {
  const BottomNavigatorDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<ProductDetaiServicelBloc, ProductDetailServiceState>(
            buildWhen: (previous, current) =>
                previous.quantity != current.quantity,
            builder: (context, state) {
              return CounterWidget(
                  decrement: () => context
                      .read<ProductDetaiServicelBloc>()
                      .add(DecrementQuantityProductEvent()),
                  increment: () => context
                      .read<ProductDetaiServicelBloc>()
                      .add(IncrementQuantityProductEvent()),
                  currentCounter: TextWidgets(
                    text: state.quantity.toString(),
                    fontSize: AppDimens.text14,
                    textColor: AppColors.darkColor,
                  ));
            },
          ),
          const SizedBox(height: 7.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidgets(
                text: 'Tổng tiền:',
                fontSize: AppDimens.text16,
                textColor: AppColors.disableTextColor,
              ),
              BlocBuilder<ProductDetaiServicelBloc, ProductDetailServiceState>(
                buildWhen: (previous, current) =>
                    previous.total != current.total ||
                    previous.quantity != current.quantity,
                builder: (context, state) {
                  return TextWidgets(
                    text: Convert.instance.convertVND(state.total),
                    fontSize: AppDimens.text16,
                    textColor: AppColors.textErrorColor,
                  );
                },
              )
            ],
          ),
          const SizedBox(height: 10.0),
          ButtonWidget(
            label: 'Thêm giỏ hàng',
            onClicked: () async {
              final cartBloc =
                  BlocProvider.of<CartServiceBloc>(context, listen: false)
                      .state;
              if (cartBloc.list.isEmpty) {
                context.read<ProductDetaiServicelBloc>().add(AddToCartEvent());
                await DialogController.instance.successNotAction(context);
                AppRoutes.pop();
                context.read<CartServiceBloc>().add(LoadCartEvent());
                context
                    .read<NavigationScreenCubit>()
                    .changeNavigatorBottom(const CartScreenState());
              } else {}
              // context.read<ProductDetaiServicelBloc>().add(AddToCartEvent());
              // context.read<CartServiceBloc>().add(LoadCartEvent());
            },
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
