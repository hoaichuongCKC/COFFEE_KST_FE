// ignore_for_file: must_be_immutable

import 'package:coffee_kst/app/common/widgets/text_form_widget.dart';
import 'package:coffee_kst/main_export.dart';

class TextFormFieldLabel extends StatelessWidget {
  TextFormFieldLabel({
    Key? key,
    required this.label,
    required this.controller,
    required this.onChanged,
    this.isRequired = false,
    required this.hintText,
    this.inputFormaters,
    this.keyboardType,
    this.textInputAction,
    required this.validator,
    this.obscureText = false,
    this.onSubmit,
    this.suffixIcon,
    this.nameRequired = '*',
  }) : super(key: key);
  final String label;
  final TextEditingController controller;
  final Function(String) onChanged;
  final Function(String)? onSubmit;
  final String? Function(String?) validator;
  final bool isRequired;
  final String hintText;
  List<TextInputFormatter>? inputFormaters;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final bool obscureText;
  final String nameRequired;
  @override
  Widget build(BuildContext context) {
    bool isLight = false;
    if (Theme.of(context).brightness == Brightness.light) {
      isLight = true;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidgets(
              text: label,
              fontSize: AppDimens.text18,
              textColor: AppColors.disableTextColor,
            ),
            isRequired ? const SizedBox(width: 5.0) : const SizedBox(),
            isRequired
                ? TextWidgets(
                    text: nameRequired,
                    fontSize: nameRequired == '*'
                        ? AppDimens.text16
                        : AppDimens.text10,
                    textColor: AppColors.textErrorColor,
                  )
                : const SizedBox(),
          ],
        ),
        const SizedBox(height: 8.0),
        isLight
            ? TextFormFielddWidget.outlineBorder(
                onChanged: onChanged,
                obscureText: obscureText,
                controller: controller,
                onSubmit: onSubmit,
                filledColor: AppColors.lightColor,
                inputFormaters: inputFormaters,
                hintText: hintText,
                validator: validator,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                outlineColor: AppColors.primaryColor,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 15.0),
                suffixIcon: suffixIcon,
              )
            : TextFormFielddWidget.none(
                onChanged: onChanged,
                obscureText: obscureText,
                controller: controller,
                onSubmit: onSubmit,
                inputFormaters: inputFormaters,
                hintText: hintText,
                validator: validator,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 15.0),
                suffixIcon: suffixIcon,
              )
      ],
    );
  }
}
