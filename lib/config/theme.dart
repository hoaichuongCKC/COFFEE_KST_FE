// ignore_for_file: deprecated_member_use

import 'package:coffee_kst/main_export.dart';
import 'package:google_fonts/google_fonts.dart';

const MaterialColor kSwatchTheme = MaterialColor(
  0xFF7409FF, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
  <int, Color>{
    50: AppColors.primaryColor, //10%
    100: AppColors.primaryColor, //20%
    200: AppColors.primaryColor, //30%
    300: AppColors.primaryColor, //40%
    400: AppColors.primaryColor, //50%
    500: AppColors.primaryColor, //60%
    600: AppColors.primaryColor, //70%
    700: AppColors.primaryColor, //80%
    800: AppColors.primaryColor, //90%
    900: AppColors.primaryColor, //100%
  },
);

class MyThemes {
  static final ThemeData darkTheme = ThemeData(
    backgroundColor: AppColors.darkColor,
    primaryColor: AppColors.darkColor,
    scaffoldBackgroundColor: AppColors.darkColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightColor,
      elevation: 0.5,
    ),
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(
      color: AppColors.lightColor,
      size: 20.0,
    ),
    primarySwatch: kSwatchTheme,
    cardColor: AppColors.lightColor,
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.poppins(
        color: AppColors.lightColor,
      ),
      titleSmall: GoogleFonts.poppins(
        color: AppColors.darkColor,
      ),
      titleLarge: GoogleFonts.poppins(
        color: AppColors.lightColor,
      ),
      bodySmall: GoogleFonts.poppins(
        color: AppColors.darkColor,
      ),
    ),
    indicatorColor: AppColors.darkColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkColor,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: AppColors.lightColor,
        size: 20.0,
      ),
      actionsIconTheme: const IconThemeData(
        color: AppColors.lightColor,
        size: 20.0,
      ),
      titleTextStyle: GoogleFonts.poppins(
        fontSize: AppDimens.text22,
        color: AppColors.lightColor,
        fontWeight: FontWeight.w700,
      ),
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkColor,
      elevation: 0.5,
    ),
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    cardColor: AppColors.disableTextColor.withAlpha(150),
    iconTheme: const IconThemeData(color: AppColors.darkColor, opacity: 0.8),
    indicatorColor: AppColors.lightColor,
    androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
    textTheme: TextTheme(
      titleMedium: GoogleFonts.poppins(
        color: AppColors.darkColor,
      ),
      titleLarge: GoogleFonts.poppins(
        color: AppColors.darkColor,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: AppColors.darkColor,
      ),
      bodySmall: GoogleFonts.poppins(
        color: AppColors.lightColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightColor,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: AppColors.darkColor,
        size: 20.0,
      ),
      actionsIconTheme: const IconThemeData(
        color: AppColors.darkColor,
        size: 20.0,
      ),
      titleTextStyle: GoogleFonts.poppins(
        fontSize: AppDimens.text22,
        color: AppColors.darkColor,
        fontWeight: FontWeight.w700,
      ),
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
  );
}
