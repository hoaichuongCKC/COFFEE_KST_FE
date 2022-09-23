import 'package:coffee_kst/config/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonWidget extends StatelessWidget {
  const SkeletonWidget.circle(
      {Key? key,
      required this.width,
      required this.height,
      this.borderRadius = const CircleBorder()})
      : super(key: key);
  const SkeletonWidget.rectangle(
      {Key? key,
      required this.width,
      required this.height,
      this.borderRadius = const RoundedRectangleBorder()})
      : super(key: key);
  final double width;
  final double height;

  final ShapeBorder borderRadius;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.disableTextColor.withAlpha(150),
      highlightColor: AppColors.disableTextColor.withAlpha(100),
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: AppColors.disableTextColor.withAlpha(150),
          shape: borderRadius,
        ),
      ),
    );
  }
}
