import 'package:coffee_kst/app/screens/home/presentation/bloc/navigation_bottom/navigation_screen_cubit.dart';
import 'package:coffee_kst/main_export.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      constraints: const BoxConstraints(
        minHeight: 60.0,
        maxHeight: 70.0,
      ),
      decoration: BoxDecoration(
        borderRadius: AppStyles.borderRadiusTopLeftRight12,
        boxShadow: [
          BoxShadow(
            color: AppColors.disableTextColor.withAlpha(100),
            blurRadius: 2.0,
            offset: const Offset(0, -.5),
          )
        ],
        color: AppColors.lightColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ItemBottomNavigatorHomeWidget(
              label: HOME_PAGE,
              iconUrl: AppIcons.HOME_ASSET,
              page: 0,
              changeScreens: () => context
                  .read<NavigationScreenCubit>()
                  .changeNavigatorBottom(const HomeScreenState()),
            ),
            ItemBottomNavigatorHomeWidget(
              label: DASHBOARD_PAGE,
              iconUrl: AppIcons.CALCULATOR_ASSET,
              page: 1,
              changeScreens: () => context
                  .read<NavigationScreenCubit>()
                  .changeNavigatorBottom(const DashboardScreenState()),
            ),
            ItemBottomNavigatorHomeWidget(
              label: CART_PAGE,
              iconUrl: AppIcons.CART_ASSET,
              page: 2,
              changeScreens: () => context
                  .read<NavigationScreenCubit>()
                  .changeNavigatorBottom(const CartScreenState()),
            ),
            ItemBottomNavigatorHomeWidget(
              label: USER_PAGE,
              iconUrl: AppIcons.USER_ASSET,
              page: 3,
              changeScreens: () => context
                  .read<NavigationScreenCubit>()
                  .changeNavigatorBottom(const ProfileScreenState()),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemBottomNavigatorHomeWidget extends StatelessWidget {
  const ItemBottomNavigatorHomeWidget(
      {Key? key,
      required this.label,
      required this.iconUrl,
      required this.page,
      required this.changeScreens})
      : super(key: key);
  final String label;
  final String iconUrl;
  final int page;
  final Function() changeScreens;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: changeScreens,
        borderRadius: AppStyles.borderRadius15,
        child: BlocBuilder<NavigationScreenCubit, int>(
          buildWhen: (previous, current) => current != previous,
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconUrl,
                  color: state == page
                      ? AppColors.primaryColor
                      : AppColors.disableTextColor,
                ),
                const SizedBox(height: 7.0),
                TextWidgets(
                  text: label,
                  fontSize: AppDimens.text10,
                  textColor: state == page
                      ? AppColors.primaryColor
                      : AppColors.disableTextColor,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
