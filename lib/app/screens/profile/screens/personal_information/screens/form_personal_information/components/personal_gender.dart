import 'package:coffee_kst/core/utils/constants_profile.dart';
import 'package:coffee_kst/main_export.dart';

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
  const GenderPersonalPI({super.key});

  @override
  State<GenderPersonalPI> createState() => _GenderPersonalPIState();
}

class _GenderPersonalPIState extends State<GenderPersonalPI> {
  ValueNotifier<PersonalGender> gender = ValueNotifier(PersonalGender.MALE);
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
        TextWidgets(
          text: 'Giới tính',
          fontSize: AppDimens.text18,
          textColor: AppColors.disableTextColor,
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
      padding: const EdgeInsets.all(10.0),
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        color: isCurrentGender
            ? AppColors.primaryColor.withAlpha(250)
            : AppColors.lightColor.withAlpha(230),
        borderRadius: AppStyles.borderRadius12,
      ),
      constraints: const BoxConstraints(
        minWidth: 80.0,
        maxHeight: 50.0,
        minHeight: 45.0,
      ),
      duration: const Duration(milliseconds: 400),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon ?? const SizedBox(),
          const SizedBox(width: 8.0),
          TextWidgets(
            text: label,
            fontSize: AppDimens.text14,
            textColor:
                isCurrentGender ? AppColors.lightColor : AppColors.darkColor,
          )
        ],
      ),
    );
  }
}
