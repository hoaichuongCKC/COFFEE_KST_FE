import 'package:coffee_kst/main_export.dart';

class SelectBoxAddressPI extends StatelessWidget {
  const SelectBoxAddressPI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextWidgets(
          text: 'Địa chỉ',
          fontSize: AppDimens.text18,
          textColor: AppColors.disableTextColor,
        ),
        const SizedBox(height: 8.0),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.08,
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: AppColors.lightColor.withAlpha(230),
              borderRadius: AppStyles.borderRadius12,
            ),
            constraints: const BoxConstraints(
              minWidth: double.infinity,
              maxHeight: 50.0,
              minHeight: 45.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidgets(
                  text: 'Chọn địa chỉ của bạn',
                  fontSize: AppDimens.text14,
                  textColor: AppColors.disableTextColor,
                ),
                const Spacer(),
                SvgPicture.asset(AppIcons.ARROW_RIGHT_ASSET)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
