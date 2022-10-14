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
          return TextWidgets(
            text: state.messageError,
            fontSize: AppDimens.text14,
            textColor: AppColors.textErrorColor,
          );
        }
        if (state.state is CartLoading) {
          return AnimatedList(
            initialItemCount: 3,
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
            padding: const EdgeInsets.only(top: 15.0),
            child: AnimatedList(
              key: listKey,
              initialItemCount: state.list.length,
              itemBuilder: (context, index, a1) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemCart(
                      onClear: () {
                        _remoteItem(context, index);
                      },
                      entity: state.list[index],
                      animation: a1,
                    ),
                    index == state.list.length - 1
                        ? const SizedBox()
                        : const SizedBox(height: 15.0),
                    index == state.list.length - 1
                        ? const SizedBox()
                        : Container(
                            height: 20.0,
                            width: double.maxFinite,
                            color: AppColors.disableTextColor.withAlpha(50),
                          ),
                  ],
                );
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  void _remoteItem(BuildContext context, int index) {
    final bloc = BlocProvider.of<CartServiceBloc>(context, listen: false).state;
    if (bloc is CartLoaded) {}
  }
}
