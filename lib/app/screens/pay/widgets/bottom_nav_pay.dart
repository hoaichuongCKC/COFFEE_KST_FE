// ignore_for_file: use_build_context_synchronously

import 'package:coffee_kst/app/screens/cart/presentation/bloc/bloc_cart/cart_bloc.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/navigation_bottom/navigation_screen_cubit.dart';
import 'package:coffee_kst/app/screens/pay/bloc/cubit/payment_invoice_cubit.dart';
import 'package:coffee_kst/app/screens/profile/screens/my_invoice/bloc/cubit/my_invoice_cubit.dart';
import 'package:coffee_kst/injection_container.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:coffee_kst/routes/routes.dart';
import 'package:lottie/lottie.dart';

class BottomNavPay extends StatelessWidget {
  const BottomNavPay({super.key});

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.watch<CartServiceBloc>().state;
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: ButtonWidget(
        label: 'Đặt hàng',
        onClicked: () {
          context.read<MyInvoiceCubit>().getAllOrder();
          context
              .read<PaymentInvoiceCubit>()
              .onPaymentInvoice(cartBloc.total, cartBloc.list[0].id);
          showGeneralDialog(
            context: context,
            pageBuilder: (context, animation, secondaryAnimation) =>
                const DialogPaymentOrder(),
          );
        },
      ),
    );
  }
}

class DialogPaymentOrder extends StatefulWidget {
  const DialogPaymentOrder({super.key});

  @override
  State<DialogPaymentOrder> createState() => _DialogPaymentOrderState();
}

class _DialogPaymentOrderState extends State<DialogPaymentOrder>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    if (controller.status == AnimationStatus.completed) {}
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentInvoiceCubit, PaymentInvoiceState>(
      listener: (context, state) {
        if (state.state is PaymentInvoiceSuccess) {
          Future.delayed(const Duration(seconds: 2), () {
            AppRoutes.pop();
            context
                .read<NavigationScreenCubit>()
                .changeNavigatorBottom(const ProfileScreenState());
            context.read<CartServiceBloc>().add(InitCartEvent());

            AppRoutes.popAndPushNamed(MY_INVOICE_PATH);
          });
        }
        if (state.state is PaymentInvoiceFailed) {
          Future.delayed(const Duration(seconds: 2), () => AppRoutes.pop());
        }
      },
      child: Dialog(
        elevation: 8.0,
        backgroundColor: AppColors.lightColor,
        shape: const RoundedRectangleBorder(
          borderRadius: AppStyles.borderRadius10,
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 100,
                    width: double.maxFinite,
                    child:
                        BlocBuilder<PaymentInvoiceCubit, PaymentInvoiceState>(
                      buildWhen: (previous, current) =>
                          previous.state != current.state,
                      builder: (context, state) {
                        if (state.state is PaymentInvoiceLoading) {
                          return Lottie.asset(
                            'assets/delivery.json',
                            controller: controller,
                            onLoaded: (p0) {
                              controller.duration = p0.duration;
                              controller.repeat();
                            },
                          );
                        }
                        if (state.state is PaymentInvoiceSuccess) {
                          return Lottie.asset(
                            'assets/successful.json',
                            controller: controller,
                            onLoaded: (p0) {
                              controller.duration = p0.duration;
                              controller.repeat();
                            },
                          );
                        }
                        if (state.state is PaymentInvoiceFailed) {
                          return Lottie.asset(
                            'assets/failed.json',
                            controller: controller,
                            onLoaded: (p0) {
                              controller.duration = p0.duration;
                              controller.repeat();
                            },
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Center(
                  child: BlocBuilder<PaymentInvoiceCubit, PaymentInvoiceState>(
                    buildWhen: (previous, current) =>
                        previous.state != current.state,
                    builder: (context, state) {
                      if (state.state is PaymentInvoiceLoading) {
                        return TextWidgets(
                          text: 'Đang order....',
                          fontSize: AppDimens.text16,
                          weight: FontWeight.w500,
                          textColor: AppColors.darkColor,
                        );
                      }
                      if (state.state is PaymentInvoiceSuccess) {
                        return TextWidgets(
                          text: 'Đặt hàng thành công',
                          fontSize: AppDimens.text16,
                          weight: FontWeight.w500,
                          textColor: AppColors.darkColor,
                        );
                      }
                      if (state.state is PaymentInvoiceFailed) {
                        return TextWidgets(
                          text: 'Đặt hàng thất bại',
                          fontSize: AppDimens.text16,
                          weight: FontWeight.w500,
                          textColor: AppColors.darkColor,
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                const SizedBox(height: 8.0),
              ],
            )),
      ),
    );
  }
}
