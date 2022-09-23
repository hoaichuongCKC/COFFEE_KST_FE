import 'package:coffee_kst/main_export.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({Key? key, required this.onChanged, required this.value})
      : super(key: key);
  final Function(bool) onChanged;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: AppStyles.borderRadius5,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInCubic,
          width: 25.0,
          decoration: BoxDecoration(
            color: value
                ? AppColors.primaryColor
                : AppColors.lightColor.withAlpha(250),
            border: value ? null : Border.all(color: AppColors.primaryColor),
            borderRadius: AppStyles.borderRadius5,
          ),
          height: 25.0,
          alignment: Alignment.center,
          child: value
              ? const Icon(
                  Icons.check,
                  size: 15.0,
                  color: AppColors.lightColor,
                )
              : null),
    );
  }
}
