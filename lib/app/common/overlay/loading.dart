import 'package:coffee_kst/main_export.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.65,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: AppColors.blackColor.withAlpha(100),
        borderRadius: AppStyles.borderRadius12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          loading,
          const SizedBox(height: 5.0),
          TextWidgets(
            text: 'Đợi xử lý',
            fontSize: AppDimens.text14,
            textColor: AppColors.lightColor,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
