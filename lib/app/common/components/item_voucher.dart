import 'package:coffee_kst/app/screens/home/domain/entities/voucher.dart';
import 'package:coffee_kst/main_export.dart';

class ItemVoucher extends StatelessWidget {
  const ItemVoucher({Key? key, required this.entity}) : super(key: key);
  final VoucherEntity entity;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 260.0,
        minHeight: 80.0,
        maxHeight: 100.0,
        maxWidth: 300.0,
      ),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.lightColor,
        borderRadius: AppStyles.borderRadius10,
        border: Border.all(color: AppColors.primaryColor, width: 0.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppIcons.VOUCHER_ASSET),
          const SizedBox(width: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 1; i <= 7; i++)
                Container(
                  width: 1.0,
                  height: 6.0,
                  color: AppColors.disableTextColor,
                )
            ],
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidgets(
                  text: entity.title,
                  fontSize: AppDimens.text14,
                  maxline: 2,
                  weight: FontWeight.w500,
                  textColor: AppColors.darkColor,
                ),
                TextWidgets(
                  text: 'Giảm ${entity.discount}%',
                  fontSize: AppDimens.text14,
                  textColor: AppColors.primaryColor,
                ),
                TextWidgets(
                  text: 'HSD: ${entity.endDate}',
                  fontSize: AppDimens.text12,
                  textColor: AppColors.disableTextColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
