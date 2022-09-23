import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/form_personal_information/bloc/edit_information_user_bloc.dart';
import 'package:coffee_kst/core/locale_keys.g.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:easy_localization/easy_localization.dart';

class SelectBoxAddressPI extends StatelessWidget {
  const SelectBoxAddressPI({super.key, required this.address});
  final String? address;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidgets(
              text: LocaleKeys.address.tr(),
              fontSize: AppDimens.text18,
              textColor: AppColors.disableTextColor,
            ),
            const SizedBox(width: 5.0),
            context.watch<EditInformationUserBloc>().state.address.isEmpty
                ? const SizedBox()
                : TextWidgets(
                    text: '(Đã chỉnh sửa)',
                    fontSize: AppDimens.text10,
                    textColor: AppColors.textErrorColor,
                  ),
          ],
        ),
        const SizedBox(height: 8.0),
        GestureDetector(
          onTap: () => context.goNamed('create_address'),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: AppColors.lightColor.withAlpha(230),
                borderRadius: AppStyles.borderRadius12,
                border: Theme.of(context).brightness == Brightness.light
                    ? Border.all(color: AppColors.primaryColor, width: 0.5)
                    : null),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextWidgets(
                    text: address!.isEmpty
                        ? 'Chọn địa chỉ của bạn'
                        : context
                                .watch<EditInformationUserBloc>()
                                .state
                                .address
                                .isNotEmpty
                            ? context
                                .watch<EditInformationUserBloc>()
                                .state
                                .address
                            : address!,
                    fontSize: AppDimens.text14,
                    maxline: 2,
                    textColor: address!.isEmpty
                        ? AppColors.disableTextColor
                        : AppColors.darkColor,
                  ),
                ),
                SvgPicture.asset(AppIcons.ARROW_RIGHT_ASSET)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
