import 'package:coffee_kst/app/screens/dashboard/presentation/bloc/tab_categ/change_tab_categ_cubit.dart';
import 'package:coffee_kst/main_export.dart';

class ItemCategDashboard extends StatelessWidget {
  const ItemCategDashboard({
    Key? key,
    required this.iconUrl,
    required this.label,
    required this.onClicked,
  }) : super(key: key);
  final String iconUrl;
  final String label;
  final Function() onClicked;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        padding: const EdgeInsets.all(7.0),
        constraints: const BoxConstraints(
          minWidth: 80,
          maxWidth: 120,
          maxHeight: 50.0,
        ),
        child: BlocBuilder<ChangeTabCategCubit, ChangeTabCategState>(
          buildWhen: (previous, current) =>
              previous.currentTab != current.currentTab,
          builder: (context, stateTab) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconUrl,
                  color: stateTab.currentTab == label
                      ? AppColors.lightColor
                      : AppColors.darkColor.withAlpha(150),
                ),
                const SizedBox(width: 10.0),
                TextWidgets(
                  text: label,
                  fontSize: AppDimens.text14,
                  textColor: stateTab.currentTab == label
                      ? AppColors.lightColor
                      : AppColors.darkColor.withAlpha(150),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
