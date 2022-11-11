import 'package:coffee_kst/app/common/dialog/dialog_controller.dart';
import 'package:coffee_kst/app/screens/cart/data/models/info_receipt.dart';
import 'package:coffee_kst/app/screens/cart/domain/entities/info_receipt.dart';
import 'package:coffee_kst/app/screens/profile/screens/my_invoice/bloc/cubit/my_invoice_cubit.dart';
import 'package:coffee_kst/injection_container.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:coffee_kst/routes/routes.dart';

class ItemInvoice extends StatelessWidget {
  const ItemInvoice(
      {super.key,
      required this.invoiceModels,
      required this.index,
      this.isVisibilityCancleOrder = false});
  final InvoiceModels invoiceModels;
  final int index;
  final bool isVisibilityCancleOrder;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      decoration: const BoxDecoration(
        color: AppColors.lightColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: TextWidgets(
              text: 'Thông tin đơn',
              fontSize: AppDimens.text18,
              textColor: AppColors.textErrorColor,
              weight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemRowCardInvoice(
                  label: 'Tên người nhận:', value: invoiceModels.shippingName),
              const SizedBox(height: 8.0),
              ItemRowCardInvoice(
                  label: 'Số điện thoại:', value: invoiceModels.shippingPhone),
              const SizedBox(height: 8.0),
              ItemRowCardInvoice(
                  label: 'Địa chỉ:', value: invoiceModels.shippingAddress),
              const SizedBox(height: 8.0),
              ItemRowCardInvoice(
                label: 'Ngày đặt:',
                value: invoiceModels.createdAt.toString(),
              ),
              const SizedBox(height: 8.0),
              const ItemRowCardInvoice(
                label: 'Thanh toán:',
                value: 'Mặc định',
                colorValue: AppColors.primaryColor,
              ),
              const SizedBox(height: 8.0),
              ListProductInvoice(productInfo: invoiceModels.productInfor),
              Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextWidgets(
                    text: 'Tổng đơn:',
                    fontSize: AppDimens.text14,
                    textColor: AppColors.darkColor,
                    weight: FontWeight.w400,
                  ),
                  TextWidgets(
                    text:
                        ' ${Convert.instance.convertVND(invoiceModels.total)}',
                    fontSize: AppDimens.text14,
                    textColor: AppColors.textErrorColor,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Visibility(
                visible: !isVisibilityCancleOrder,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonWidget(
                      width: 150,
                      height: 40.0,
                      label: 'Huỷ đơn',
                      onClicked: () {
                        DialogController.instance.warning(
                          message: 'Bạn có chắc muốn xoá đơn hàng không?',
                          context: context,
                          nameCancle: 'Không',
                          nameConfirm: 'Có',
                          onCancle: () => AppRoutes.pop(),
                          onConfirm: () {
                            final list = <int>[];
                            if (invoiceModels.productInfor.length > 1) {
                              for (var element in invoiceModels.productInfor) {
                                list.add(element.invoiceDetailsId);
                              }
                            } else {
                              list.add(invoiceModels
                                  .productInfor[0].invoiceDetailsId);
                            }
                            context
                                .read<MyInvoiceCubit>()
                                .deleteItemOrder(invoiceModels.id, list, index);
                            AppRoutes.pop();
                          },
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ItemRowCardInvoice extends StatelessWidget {
  const ItemRowCardInvoice(
      {super.key,
      required this.label,
      required this.value,
      this.colorValue = AppColors.disableTextColor});
  final String label;
  final String value;
  final Color colorValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgets(
          text: label,
          fontSize: AppDimens.text14,
          textColor: AppColors.darkColor,
          weight: FontWeight.w400,
        ),
        const SizedBox(width: 7.0),
        Expanded(
          child: TextWidgets(
            text: value,
            fontSize: AppDimens.text14,
            textColor: colorValue,
            weight: FontWeight.w300,
            maxline: 2,
          ),
        ),
      ],
    );
  }
}

class ListProductInvoice extends StatelessWidget {
  const ListProductInvoice({super.key, required this.productInfo});
  final List<ProductInforEntity> productInfo;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 8.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productInfo.length,
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 70.0,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: AppStyles.borderRadius5,
                  child: AspectRatio(
                    aspectRatio: 16 / 13,
                    child: ImageWidget(
                      url: productInfo[index].imageUrl,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidgets(
                        text: productInfo[index].name,
                        fontSize: AppDimens.text14,
                        textColor: AppColors.darkColor,
                        weight: FontWeight.w300,
                        maxline: 2,
                      ),
                      TextWidgets(
                        text: 'x ${productInfo[index].quantity}',
                        fontSize: AppDimens.text12,
                        textColor: AppColors.darkColor,
                        weight: FontWeight.w300,
                      ),
                      TextWidgets(
                        text: Convert.instance
                            .convertVND(int.parse(productInfo[index].price)),
                        fontSize: AppDimens.text12,
                        textColor: AppColors.textErrorColor,
                        weight: FontWeight.w300,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextWidgets(
                      text: 'size: ${productInfo[index].sizeName}',
                      fontSize: AppDimens.text12,
                      textColor: AppColors.disableTextColor,
                      weight: FontWeight.w300,
                    ),
                    TextWidgets(
                      text: 'loại: ${productInfo[index].categName}',
                      fontSize: AppDimens.text12,
                      textColor: AppColors.disableTextColor,
                      weight: FontWeight.w300,
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 5.0),
          ListToppingInvoice(topping: productInfo[index].toppingInfor),
        ],
      ),
    );
  }
}

class ListToppingInvoice extends StatelessWidget {
  const ListToppingInvoice({super.key, required this.topping});
  final List<ToppingInforEntity> topping;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: topping.length,
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 5.0),
      itemBuilder: (context, index) => SizedBox(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 8.0,
              height: 8.0,
              child: DecoratedBox(
                decoration: ShapeDecoration(
                    color: AppColors.textErrorColor, shape: CircleBorder()),
              ),
            ),
            const SizedBox(width: 5.0),
            ClipRRect(
              borderRadius: AppStyles.borderRadius5,
              child: AspectRatio(
                aspectRatio: 16 / 13,
                child: ImageWidget(
                  url: topping[index].imageUrl,
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidgets(
                  text: '${topping[index].name} x${topping[index].quantity}',
                  fontSize: AppDimens.text14,
                  textColor: AppColors.darkColor,
                  weight: FontWeight.w300,
                  maxline: 2,
                ),
                TextWidgets(
                  text: Convert.instance.convertVND(topping[index].price),
                  fontSize: AppDimens.text12,
                  textColor: AppColors.textErrorColor,
                  weight: FontWeight.w300,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
