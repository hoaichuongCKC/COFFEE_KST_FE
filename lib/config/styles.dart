import 'package:coffee_kst/config/colors.dart';
import 'package:flutter/cupertino.dart';

class AppStyles {
  //private contructors
  AppStyles._();

  //style container
  // -container - borderRadius alln
  static const BorderRadius borderRadius2 =
      BorderRadius.all(Radius.circular(2.0));
  static const BorderRadius borderRadius5 =
      BorderRadius.all(Radius.circular(5.0));
  static const BorderRadius borderRadius10 =
      BorderRadius.all(Radius.circular(10.0));

  static const BorderRadius borderRadius12 =
      BorderRadius.all(Radius.circular(12.0));

  static const BorderRadius borderRadius15 =
      BorderRadius.all(Radius.circular(15.0));

  static const BorderRadius borderRadius20 =
      BorderRadius.all(Radius.circular(20.0));

  // -container - borderRadius top  left -right
  static const BorderRadius borderRadiusTopLeftRight10 = BorderRadius.only(
      topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0));

  static const BorderRadius borderRadiusTopLeftRight12 = BorderRadius.only(
      topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0));

  static const BorderRadius borderRadiusTopLeftRight15 = BorderRadius.only(
      topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0));

  static const BorderRadius borderRadiusTopLeftRight20 = BorderRadius.only(
      topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0));
  static const BorderRadius borderRadiusBottomLeftRight20 = BorderRadius.only(
      bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0));
  //border - container
  // static const BorderRadius borderPurple = BorderRadius.only(
  //     topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0));
  static BoxDecoration pinputUnderline = BoxDecoration(
    color: AppColors.lightColor,
    border: Border(
      bottom: BorderSide(
        color: AppColors.primaryColor.withAlpha(100),
      ),
    ),
  );
  static BoxDecoration pinputOutline = const BoxDecoration(
    borderRadius: borderRadius12,
    color: AppColors.lightColor,
  );
}
