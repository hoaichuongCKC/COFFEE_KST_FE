// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, constant_identifier_names, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en_US = {
    "english": "English",
    "default_is_vietnamese": "Default is Vietnamese",
    "background_app": "Background app",
    "background_dark": "Dark",
    "logout": "Logout",
    "login": "Login",
    "personal_information": "Personal Information",
    "change_password": "Change Password",
    "my_favorite": "My Favorite",
    "my_receipt": "My Receipt",
    "settings": "Settings",
    "old_password": "Old password",
    "new_password": "New password",
    "confirm_password": "Confirm password",
    "confirm": "Confirm",
    "enter_old_passowrd": "Enter old password",
    "enter_new_passowrd": "Enter new password",
    "enter_confirm_passowrd": "Enter confirm password",
    "processing": "Processing",
    "please_fill_in_this_field": "Please fill in this field",
    "fullname": "Fullname",
    "address": "Address",
    "gender": "Gender",
    "male_gender": "Male",
    "female_gender": "Female",
    "another_gender": "Another",
    "edit": "Edit",
    "update": "Update",
    "edit_information": "Edit Information",
    "province": "Provinces",
    "district": "Districts",
    "commune": "Communes",
    "specific_address": "Specific address",
    "edit_successfully": "Edit successfully",
    "enter_your_phone": "Enter your phone",
    "login_with_phone": "Login with phone",
    "login_with_password": "Login with password"
  };
  static const Map<String, dynamic> vi_VN = {
    "english": "Tiếng Anh",
    "default_is_vietnamese": "Mặc định là Tiếng Việt",
    "background_app": "Nền ứng dụng",
    "background_dark": "Nền tối",
    "logout": "Đăng xuất",
    "login": "Đăng nhập",
    "personal_information": "Thông tin cá nhân",
    "change_password": "Đổi mật khẩu",
    "my_favorite": "Sản phẩm yêu thích",
    "my_receipt": "Đơn hàng của tôi",
    "settings": "Cài đặt",
    "old_password": "Mật khẩu cũ",
    "new_password": "Mật khẩu mới",
    "confirm_password": "Xác nhận mật khẩu",
    "confirm": "Xác nhận",
    "enter_old_passowrd": "Nhập mật khẩu cũ",
    "enter_new_passowrd": "Nhập mật khẩu mới",
    "enter_confirm_passowrd": "Nhập lại mật khẩu mới",
    "processing": "Đang xử lý",
    "please_fill_in_this_field": "Vui lòng nhập trường này",
    "fullname": "Họ tên",
    "address": "Địa chỉ",
    "gender": "Giới tính",
    "male_gender": "Nam",
    "female_gender": "Nữ",
    "another_gender": "Khác",
    "edit": "Sửa",
    "update": "Cập nhật",
    "edit_information": "Chỉnh sửa thông tin",
    "province": "Tỉnh thành phố",
    "district": "Quận huyện",
    "commune": "Phường xã",
    "specific_address": "Địa chỉ cụ thể",
    "edit_successfully": "Chỉnh sửa thành công",
    "enter_your_phone": "Nhập số điện thoại của bạn",
    "login_with_phone": "Đăng nhập với số điện thoại",
    "login_with_password": "Đăng nhập với mật khẩu"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en_US": en_US,
    "vi_VN": vi_VN
  };
}
