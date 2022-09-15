import 'package:coffee_kst/config/colors.dart';
import 'package:coffee_kst/config/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BgFlowLogin extends StatelessWidget {
  const BgFlowLogin({Key? key, required this.child, this.overlay})
      : super(key: key);
  final Widget child;
  final Widget? overlay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppIcons.HALF_CIRCLE_ABOVE),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset(AppIcons.HALF_CIRCLE_BELOW),
          ),
          child,
          overlay != null
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: AppColors.darkColor.withAlpha(100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      overlay!,
                    ],
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
