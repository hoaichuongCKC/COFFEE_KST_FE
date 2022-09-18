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
ThemeData themeDataDark = ThemeData(
  backgroundColor: AppColors.darkColor,
  toggleableActiveColor: AppColors.primaryColor,
  dialogBackgroundColor: AppColors.lightColor,
  scaffoldBackgroundColor: AppColors.darkColor,
  dividerColor: AppColors.disableTextColor,
  primarySwatch: kSwatchTheme,
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
  // ignore: deprecated_member_use
  androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
);
