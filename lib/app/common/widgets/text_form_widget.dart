import 'package:coffee_kst/main_export.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFielddWidget extends TextFormFieldWidget {
  TextFormFielddWidget.none({
    Key? key,
    required Function(String) onChanged,
    String? Function(String?)? validator,
    Function(String)? onSubmit,
    List<TextInputFormatter>? inputFormaters,
    required TextEditingController controller,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    EdgeInsetsGeometry? contentPadding,
    FocusNode? focusNode,
    bool obscureText = false,
    bool readOnly = false,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? hintText,
    Color? filledColor,
    int line = 1,
  }) : super(
          key: key,
          onChanged: onChanged,
          validator: validator,
          line: line,
          onSubmit: onSubmit,
          inputFormaters: inputFormaters,
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          contentPadding: contentPadding,
          focusNode: focusNode,
          obscureText: obscureText,
          suffixIcon: suffixIcon,
          hintText: hintText,
          filledColor: filledColor,
          decoration: InputDecoration(
            hoverColor: Colors.transparent,
            errorStyle: GoogleFonts.poppins(
              color: AppColors.textErrorColor,
              fontSize: AppDimens.text10,
              fontWeight: FontWeight.w400,
            ),
            prefixIconConstraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 40.0,
                maxHeight: 60.0,
                maxWidth: 60.0),
            hintStyle: const TextStyle(
              fontSize: AppDimens.text14,
              color: AppColors.disableTextColor,
              fontWeight: FontWeight.w200,
            ),
            focusColor: AppColors.primaryColor,
            suffixIconColor: AppColors.primaryColor,
            contentPadding: contentPadding,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            prefixIconColor: AppColors.primaryColor,
            hintText: hintText,
            errorMaxLines: 2,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: AppStyles.borderRadius10,
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: AppStyles.borderRadius10,
            ),
            errorBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.textErrorColor, width: 0.5),
              borderRadius: AppStyles.borderRadius10,
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.textErrorColor, width: 0.5),
              borderRadius: AppStyles.borderRadius10,
            ),
            filled: true,
            fillColor: filledColor ?? AppColors.lightColor.withAlpha(230),
          ),
        );

  TextFormFielddWidget.outlineBorder({
    Key? key,
    required Function(String) onChanged,
    String? Function(String?)? validator,
    Function(String)? onSubmit,
    List<TextInputFormatter>? inputFormaters,
    required TextEditingController controller,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    EdgeInsetsGeometry? contentPadding,
    FocusNode? focusNode,
    bool obscureText = false,
    bool readOnly = false,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? hintText,
    Color? filledColor,
    Color? outlineColor,
    int maxLine = 1,
  }) : super(
          key: key,
          onChanged: onChanged,
          validator: validator,
          onSubmit: onSubmit,
          inputFormaters: inputFormaters,
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          contentPadding: contentPadding,
          focusNode: focusNode,
          obscureText: obscureText,
          suffixIcon: suffixIcon,
          line: maxLine,
          hintText: hintText,
          filledColor: filledColor,
          decoration: InputDecoration(
            errorStyle: GoogleFonts.poppins(
              color: AppColors.textErrorColor,
              fontSize: AppDimens.text10,
              fontWeight: FontWeight.w400,
            ),
            suffixIconColor: AppColors.primaryColor,
            hintStyle: const TextStyle(
              fontSize: AppDimens.text14,
              color: AppColors.disableTextColor,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: prefixIcon,
            focusColor: AppColors.primaryColor,
            contentPadding: contentPadding,
            suffixIcon: suffixIcon,
            hintText: hintText,
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: outlineColor ?? AppColors.disableTextColor,
                  width: 0.5),
              borderRadius: AppStyles.borderRadius10,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: outlineColor ?? AppColors.disableTextColor,
                  width: 0.5),
              borderRadius: AppStyles.borderRadius10,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: outlineColor ?? AppColors.disableTextColor,
                  width: 0.5),
              borderRadius: AppStyles.borderRadius10,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: outlineColor ?? AppColors.disableTextColor,
                  width: 0.5),
              borderRadius: AppStyles.borderRadius10,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: outlineColor ?? AppColors.textErrorColor, width: 0.5),
              borderRadius: AppStyles.borderRadius10,
            ),
            filled: true,
            fillColor: filledColor ?? AppColors.lightColor.withAlpha(230),
          ),
        );
}

// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.onChanged,
    this.validator,
    this.onSubmit,
    this.inputFormaters,
    required this.controller,
    this.keyboardType,
    this.textInputAction,
    this.contentPadding,
    this.focusNode,
    this.obscureText = false,
    this.readOnly = false,
    this.suffixIcon,
    this.hintText,
    this.filledColor,
    required this.decoration,
    this.line = 1,
  }) : super(key: key);
  final Function(String) onChanged;
  final Function(String)? onSubmit;
  final List<TextInputFormatter>? inputFormaters;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final String? hintText;
  final FocusNode? focusNode;
  final bool obscureText;
  final bool readOnly;
  final int line;
  final String? Function(String?)? validator;
  final Color? filledColor;
  final InputDecoration decoration;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      maxLines: line,
      style: const TextStyle(
        fontSize: AppDimens.text14,
        color: AppColors.darkColor,
        fontWeight: FontWeight.w400,
      ),
      obscureText: obscureText,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormaters,
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      validator: validator,
      controller: controller,
      decoration: decoration,
    );
  }
}
