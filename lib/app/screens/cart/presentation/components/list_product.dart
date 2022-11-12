import 'package:coffee_kst/app/common/dialog/dialog_controller.dart';
import 'package:coffee_kst/app/screens/cart/domain/entities/cart.dart';
import 'package:coffee_kst/app/screens/cart/presentation/bloc/bloc_cart/cart_bloc.dart';
import 'package:coffee_kst/app/screens/cart/presentation/widgets/item_cart.dart';
import 'package:coffee_kst/main_export.dart';

class ListProductCart extends StatelessWidget {
  ListProductCart({Key? key}) : super(key: key);
  final listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartServiceBloc, CartServiceState>(
      builder: (context, state) {
        if (state.state is CartDataEmpty) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                    image: AssetImage('assets/images/cart/cart-empty.jpg')),
                const SizedBox(height: 10.0),
                TextWidgets(
                  text: 'Hiện tại giỏ hàng của bạn đang trống!',
                  fontSize: AppDimens.text14,
                  textColor: AppColors.disableTextColor,
                )
              ],
            ),
          );
        }
        if (state.state is CartLoadFailed) {
          return Column(
            children: [
              TextWidgets(
                text: state.messageError,
                fontSize: AppDimens.text14,
                textColor: AppColors.textErrorColor,
              ),
              const SizedBox(height: 8.0),
              GestureDetector(
                onTap: () =>
                    context.read<CartServiceBloc>().add(LoadCartEvent()),
                child: TextWidgets(
                  text: 'Kết nối lại',
                  fontSize: AppDimens.text14,
                  textColor: AppColors.primaryColor,
                  weight: FontWeight.w500,
                ),
              )
            ],
          );
        }
        if (state.state is CartLoading) {
          return AnimatedList(
            initialItemCount: 2,
            itemBuilder: (context, index, a1) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: SkeletonWidget.rectangle(
                  width: double.maxFinite,
                  height: 100.0,
                  borderRadius: RoundedRectangleBorder(
                    borderRadius: AppStyles.borderRadius10,
                  ),
                ),
              );
            },
          );
        }
        if (state.state is CartLoaded) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: AnimatedList(
              key: listKey,
              initialItemCount: state.list.length,
              itemBuilder: (context, index, a1) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemCart(
                        onClear: () async {
                          _remoteItem(context, index, state.list[index]);
                          DialogController.instance
                              .successNotAction(context, 'Xoá thành công');
                        },
                        entity: state.list[index],
                        animation: a1,
                        index: index,
                      ),
                      index == state.list.length - 1
                          ? const SizedBox(height: 30)
                          : const SizedBox(height: 15.0),
                    ],
                  ),
                );
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  void _remoteItem(BuildContext context, int index, CartEntity entity) async {
    final bloc = BlocProvider.of<CartServiceBloc>(context, listen: false);
    bloc.add(
      RemoveItemCartLocalEvent(
        invoiceDetailId: entity.invoiceDetailId,
        index: index,
        productID: entity.productId,
        sizeName: entity.sizeName ?? '',
      ),
    );
    final item = bloc.state.list[index];
    listKey.currentState!.removeItem(
        index,
        (context, animation) => ItemCart(
              onClear: () {},
              entity: item,
              animation: animation,
              index: index,
            ),
        duration: const Duration(milliseconds: 400));
  }
}
