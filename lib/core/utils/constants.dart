// ignore_for_file: constant_identifier_names, non_constant_identifier_names
//const message app
//-- message error validate when value null
import 'package:coffee_kst/core/locale_keys.g.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

String MESSAGE_ERROR_VALIDATE_ISEMPTY =
    LocaleKeys.please_fill_in_this_field.tr();
String MESSAGE_LOADING = LocaleKeys.processing.tr();
String MESSAGE_ERROR_VALIDATE_LENGTH = "Số điện thoại không hợp lệ";
//code api
const int SUCCESS_CODE = 200;
//LOGIN FAFILED
const int FAILED_CODE = 201;
const int NULL_PARAMS_CODE = 404;
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

//name page home - dashboard - cart - user
const String HOME_PAGE = 'Trang chủ';
const String DASHBOARD_PAGE = 'Danh mục';
const String CART_PAGE = 'Giỏ hàng';
const String USER_PAGE = 'Cá nhân';

class Convert {
  Convert._privateConstructor();

  static final Convert _instance = Convert._privateConstructor();

  static Convert get instance => _instance;
  String convertVND(number) {
    final oCcy = NumberFormat("#,##0", "vi_VN");
    return '${oCcy.format(number)}đ';
  }
}
