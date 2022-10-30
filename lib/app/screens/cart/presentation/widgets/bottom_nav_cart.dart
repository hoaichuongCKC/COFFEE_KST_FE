import 'package:coffee_kst/app/screens/cart/presentation/bloc/bloc_cart/cart_bloc.dart';
import 'package:coffee_kst/main_export.dart';

class BottomNavCart extends StatelessWidget {
  const BottomNavCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CartServiceBloc>().state.state;
    return bloc is CartLoaded
        ? Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ButtonWidget(
                  label: 'Thanh toán',
                  onClicked: () {},
                  height: 40,
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
