import 'package:coffee_kst/app/screens/home/data/models/voucher.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:coffee_kst/routes/routes.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({Key? key, required this.entity}) : super(key: key);
  final VoucherModel entity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            fit: StackFit.passthrough,
            children: [
              Image.asset(
                "assets/images/voucher/background_header.jpeg",
                fit: BoxFit.fill,
              ),
              _buildArrowBack(context),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: entity.title,
                  child: TextWidgets(
                    text: entity.title,
                    fontSize: AppDimens.text18,
                    textColor: AppColors.primaryColor,
                    weight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8.0),
                Hero(
                  tag: 'Giảm ngay ${entity.discount}%',
                  child: TextWidgets(
                    text: 'Giảm ngay ${entity.discount}%',
                    fontSize: AppDimens.text14,
                    textColor: AppColors.textErrorColor,
                    weight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidgets(
                      text: 'Ngày kết thúc: ${entity.endDate}',
                      fontSize: AppDimens.text14,
                      textColor: AppColors.disableTextColor,
                      weight: FontWeight.w400,
                    ),
                    TextWidgets(
                      text: 'Lượt: ${entity.limit}',
                      fontSize: AppDimens.text14,
                      textColor: AppColors.disableTextColor,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                SvgPicture.asset(AppIcons.VOUCHER_ASSET),
                const SizedBox(height: 8.0),
                TextWidgets(
                  text: 'Thông tin',
                  fontSize: AppDimens.text16,
                  textColor: AppColors.darkColor,
                  weight: FontWeight.w500,
                ),
                const SizedBox(height: 8.0),
                TextWidgets(
                  text: '- ${entity.description}',
                  fontSize: AppDimens.text14,
                  textColor: AppColors.darkColor,
                  weight: FontWeight.w400,
                  maxline: 10,
                ),
                const SizedBox(height: 8.0),
                TextWidgets(
                  text:
                      '- Với điều kiện hoá đơn phải đạt ${Convert.instance.convertVND(entity.condition)}',
                  fontSize: AppDimens.text14,
                  textColor: AppColors.darkColor,
                  weight: FontWeight.w400,
                  maxline: 10,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArrowBack(BuildContext context) => Positioned(
        top: 7.0,
        left: 7.0,
        child: SafeArea(
          child: InkWell(
            onTap: () => AppRoutes.pop(),
            child: Container(
              height: 30.0,
              width: 30.0,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
                color: AppColors.lightColor,
              ),
              alignment: Alignment.center,
              child: Stack(
                fit: StackFit.expand,
                children: const [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 15.0,
                      color: AppColors.darkColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
