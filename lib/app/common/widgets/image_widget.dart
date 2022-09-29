import 'package:coffee_kst/main_export.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.contain,
      fadeOutDuration: const Duration(milliseconds: 200),
      fadeOutCurve: Curves.easeOut,
      fadeInDuration: const Duration(milliseconds: 200),
      errorWidget: (BuildContext context, String url, dynamic error) {
        return TextWidgets(
          text: error,
          fontSize: AppDimens.text12,
          textColor: AppColors.textErrorColor,
        );
      },
    );
  }
}
