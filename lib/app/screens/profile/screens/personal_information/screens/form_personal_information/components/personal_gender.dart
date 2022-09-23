import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/form_personal_information/bloc/edit_information_user_bloc.dart';
import 'package:coffee_kst/core/utils/constants_profile.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:easy_localization/easy_localization.dart';

List<Map<String, dynamic>> listGender = [
  {
    'icon': SvgPicture.asset(AppIcons.MALE_ASSET),
    'label': MALE_NAME,
    'gender': PersonalGender.MALE,
  },
  {
    'icon': SvgPicture.asset(AppIcons.FEMALE_ASSET),
    'label': FEMALE_NAME,
    'gender': PersonalGender.FEMALE,
  },
  {
    'icon': null,
    'label': ANOTHER_NAME,
    'gender': PersonalGender.ANOTHER,
  }
];

// ignore: must_be_immutable
class GenderPersonalPI extends StatefulWidget {
  const GenderPersonalPI({super.key, required this.gender});
  final PersonalGender gender;
  @override
  State<GenderPersonalPI> createState() => _GenderPersonalPIState();
}

class _GenderPersonalPIState extends State<GenderPersonalPI> {
  ValueNotifier<PersonalGender> gender = ValueNotifier(PersonalGender.MALE);
  PersonalGender get getGender => widget.gender;

  @override
  void initState() {
    gender.value = getGender;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    gender.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidgets(
              text: 'Giới tính',
              fontSize: AppDimens.text18,
              textColor: AppColors.disableTextColor,
            ),
            const SizedBox(width: 5.0),
            context.watch<EditInformationUserBloc>().state.gender.isEmpty
                ? const SizedBox()
                : TextWidgets(
                    text: '(Đã chỉnh sửa)',
                    fontSize: AppDimens.text10,
                    textColor: AppColors.textErrorColor,
                  ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: listGender.map((element) {
              return InkWell(
                onTap: () {
                  if (element['gender'] != gender.value) {
                    gender.value = element["gender"];
                    context
                        .read<EditInformationUserBloc>()
                        .add(ChangedGenderEvent(gender: element["label"]));
                  }
                },
                borderRadius: AppStyles.borderRadius12,
                child: ValueListenableBuilder(
                  valueListenable: gender,
                  builder: (context, PersonalGender currenGender, child) {
                    return _buildItemGender(
                      context,
                      element['icon'],
                      element['label'],
                      element['gender'] == currenGender,
                    );
                  },
                ),
              );
            }).toList())
      ],
    );
  }

  Widget _buildItemGender(
      BuildContext context, Widget? icon, String label, bool isCurrentGender) {
    return AnimatedContainer(
      width: MediaQuery.of(context).size.width * 1 / 4,
      padding: const EdgeInsets.all(6.0),
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        color: isCurrentGender
            ? AppColors.primaryColor.withAlpha(250)
            : Theme.of(context).brightness == Brightness.light
                ? AppColors.disableTextColor.withAlpha(50)
                : AppColors.lightColor.withAlpha(230),
        borderRadius: AppStyles.borderRadius12,
      ),
      constraints: const BoxConstraints(
        minWidth: 80.0,
        maxHeight: 50.0,
        minHeight: 45.0,
      ),
      duration: const Duration(milliseconds: 200),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon ?? const SizedBox(width: 10.0),
          const SizedBox(width: 5.0),
          TextWidgets(
            text: label.tr(),
            fontSize: AppDimens.text14,
            textColor:
                isCurrentGender ? AppColors.lightColor : AppColors.darkColor,
          )
        ],
      ),
    );
  }
}
