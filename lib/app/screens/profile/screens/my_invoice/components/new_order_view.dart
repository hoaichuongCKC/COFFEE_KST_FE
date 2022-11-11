import 'package:coffee_kst/app/screens/profile/screens/my_invoice/bloc/cubit/my_invoice_cubit.dart';
import 'package:coffee_kst/app/screens/profile/screens/my_invoice/widgets/item_invoice.dart';
import 'package:coffee_kst/main_export.dart';

class NewOrderView extends StatelessWidget {
  const NewOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyInvoiceCubit, MyInvoiceState>(
      // buildWhen: (previous, current) =>
      //     previous.stateApi != current.stateApi ||
      //     previous.listNewOrder != current.listNewOrder,
      listener: (context, state) {},
      builder: (context, state) {
        print(1111);
        if (state.listNewOrder.isEmpty && state.stateApi is SuccessState) {
          return Center(
            child: TextWidgets(
              text: 'Hiện bạn chưa có đơn nào trong tài khoản này!',
              fontSize: AppDimens.text16,
              textColor: AppColors.disablePrimaryButtonColor,
              weight: FontWeight.w500,
            ),
          );
        }
        if (state.stateApi is LoadingState) {
          return Center(
            child: loading,
          );
        }
        if (state.stateApi is FailedState) {
          return Center(
            child: TextWidgets(
              text: state.messageError,
              textColor: AppColors.textErrorColor,
              fontSize: AppDimens.text18,
            ),
          );
        }
        if (state.stateApi is SuccessState) {
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10.0),
            itemCount: state.listNewOrder.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemInvoice(
                  invoiceModels: state.listNewOrder[index], index: index);
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
