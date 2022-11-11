import 'package:coffee_kst/app/screens/cart/presentation/bloc/bloc_cart/cart_bloc.dart';
import 'package:coffee_kst/app/screens/pay/widgets/item_infor_cus.dart';
import 'package:coffee_kst/database/box/information_user.dart';
import 'package:coffee_kst/database/hive/infor_user/infor_user.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:coffee_kst/routes/routes.dart';

class ShowInforCustomer extends StatelessWidget {
  const ShowInforCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidgets(
              text: '*Thông tin đơn hàng',
              fontSize: AppDimens.text18,
              textColor: AppColors.darkColor,
              weight: FontWeight.w500,
            ),
            GestureDetector(
              onTap: () => AppRoutes.pushNamed(EDIT_INFOR_CUSTOMER_PAY_PATH),
              child: SvgPicture.asset(AppIcons.EDIT_ASSET),
            )
          ],
        ),
        const SizedBox(height: 7.0),
        ValueListenableBuilder<Box<InformationUserHive>>(
          valueListenable:
              Hive.box<InformationUserHive>(NAME_BOX_INFORMATION).listenable(),
          builder: (context, Box<InformationUserHive> box, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemInforInvoice(
                  label: 'Người nhận hàng',
                  text: box.get(KEY_BOX_INFORMATION)!.fullname,
                ),
                const SizedBox(height: 7.0),
                ItemInforInvoice(
                  label: 'Số điện thoại',
                  text: box.get(KEY_BOX_INFORMATION)!.phone,
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 7.0),
        ItemInforInvoice(
          label: 'Tạm tính',
          text: Convert.instance
              .convertVND(context.watch<CartServiceBloc>().state.total),
          colorText: AppColors.textErrorColor,
          weightText: FontWeight.w400,
        ),
        const SizedBox(height: 7.0),
        ItemInforInvoice(
          label: 'Khuyến mãi',
          text: 'Áp dụng ngay',
          onClicked: () => AppRoutes.pushNamed(LIST_VOUCHER_PATH),
          colorText: AppColors.primaryColor,
          weightText: FontWeight.w500,
        ),
        const SizedBox(height: 7.0),
        ItemInforInvoice(
          label: 'Tiền ship',
          text: '0đ',
          colorText: AppColors.textErrorColor,
          weightText: FontWeight.w400,
        ),
        const SizedBox(height: 7.0),
        ItemInforInvoice(
          label: 'Tổng đơn',
          text: Convert.instance
              .convertVND(context.watch<CartServiceBloc>().state.total),
          colorText: AppColors.textErrorColor,
          weightText: FontWeight.w400,
        ),
      ],
    );
  }
}
