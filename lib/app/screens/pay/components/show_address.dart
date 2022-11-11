import 'package:coffee_kst/database/box/information_user.dart';
import 'package:coffee_kst/database/hive/infor_user/infor_user.dart';
import 'package:coffee_kst/main_export.dart';

class ShowAddress extends StatelessWidget {
  const ShowAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(AppIcons.LOCATION_ASSET),
        const SizedBox(width: 10.0),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidgets(
                    text: 'Địa chỉ giao',
                    fontSize: AppDimens.text18,
                    textColor: AppColors.darkColor,
                    weight: FontWeight.w500,
                  ),
                  const SizedBox(width: 7.0),
                  SvgPicture.asset(AppIcons.EDIT_ASSET)
                ],
              ),
              const SizedBox(height: 4.0),
              ValueListenableBuilder<Box<InformationUserHive>>(
                  valueListenable:
                      Hive.box<InformationUserHive>(NAME_BOX_INFORMATION)
                          .listenable(),
                  builder: (context, Box<InformationUserHive> box, child) {
                    return TextWidgets(
                      text: box.get(KEY_BOX_INFORMATION)!.full_address,
                      fontSize: AppDimens.text14,
                      textColor: AppColors.darkColor,
                      maxline: 3,
                      weight: FontWeight.w300,
                    );
                  }),
            ],
          ),
        )
      ],
    );
  }
}
