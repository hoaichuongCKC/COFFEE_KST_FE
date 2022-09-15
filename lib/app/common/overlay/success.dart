import 'package:coffee_kst/main_export.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SuccessOverlay extends StatelessWidget {
  const SuccessOverlay({Key? key, required this.message}) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loading = SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: ShapeDecoration(
            color: index.isEven ? AppColors.lightColor : AppColors.primaryColor,
            shape: const CircleBorder(),
          ),
        );
      },
    );
    return Container(
      width: size.width * 0.65,
      height: size.height * 0.15,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: AppColors.blackColor.withAlpha(100),
        borderRadius: AppStyles.borderRadius12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          loading,
          const SizedBox(height: 8.0),
          TextWidgets(
            text: message,
            fontSize: AppDimens.text14,
            textColor: AppColors.lightColor,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
