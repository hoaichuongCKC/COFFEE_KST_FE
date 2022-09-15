import 'package:coffee_kst/config/colors.dart';
import 'package:coffee_kst/config/dimens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidgets extends Text {
  TextWidgets({
    Key? key,
    required String text,
    Color textColor = AppColors.lightColor,
    int maxline = 1,
    TextAlign textAlign = TextAlign.left,
    FontWeight weight = FontWeight.w400,
    TextDecoration textDecoration = TextDecoration.none,
    FontStyle fontStyle = FontStyle.normal,
    double fontSize = AppDimens.text14,
  }) : super(
          text,
          key: key,
          style: GoogleFonts.poppins(
            color: textColor,
            fontSize: fontSize,
            fontWeight: weight,
            decoration: textDecoration,
            fontStyle: fontStyle,
          ),
          maxLines: maxline,
          textAlign: textAlign,
          overflow: TextOverflow.visible,
        );
}
