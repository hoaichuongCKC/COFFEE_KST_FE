import 'package:coffee_kst/main_export.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator(
      {Key? key, required this.onChanged, required this.currentPage})
      : super(key: key);
  final Function(int) onChanged;
  final int currentPage;
  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int get currentPage => widget.currentPage;
  final GlobalKey keyHome = GlobalKey();
  final GlobalKey keyDashboard = GlobalKey();
  final GlobalKey keyCart = GlobalKey();
  final GlobalKey keyUser = GlobalKey();
  Size size = const Size(0.0, 0.0);
  Offset offset = const Offset(0.0, 0.0);
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      size = keyHome.currentContext!.size!;
      // final box = keyHome.currentContext!.findRenderObject() as RenderBox;
      // offset = box.localToGlobal(Offset.zero);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      constraints: const BoxConstraints(
        minHeight: 70.0,
        maxHeight: 80.0,
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
            bottomNavigationBarHome,
            bottomNavigationBarDashboard,
            bottomNavigationBarCart,
            bottomNavigationBarUser
          ],
        ),
      ),
    );
  }

  Widget get bottomNavigationBarHome {
    return Expanded(
      key: keyHome,
      child: InkWell(
        onTap: () => widget.onChanged(0),
        borderRadius: AppStyles.borderRadius15,
        child:
            _buildContentItem(AppIcons.HOME_ASSET, HOME_PAGE, currentPage == 0),
      ),
    );
  }

  Widget get bottomNavigationBarDashboard {
    return Expanded(
      key: keyDashboard,
      child: InkWell(
        onTap: () => widget.onChanged(1),
        borderRadius: AppStyles.borderRadius15,
        child: _buildContentItem(
            AppIcons.DASBOARD_ASSET, DASHBOARD_PAGE, currentPage == 1),
      ),
    );
  }

  Widget get bottomNavigationBarCart {
    return Expanded(
      key: keyCart,
      child: InkWell(
        onTap: () => widget.onChanged(2),
        borderRadius: AppStyles.borderRadius15,
        child:
            _buildContentItem(AppIcons.CART_ASSET, CART_PAGE, currentPage == 2),
      ),
    );
  }

  Widget get bottomNavigationBarUser {
    return Expanded(
      key: keyUser,
      child: InkWell(
        onTap: () => widget.onChanged(3),
        borderRadius: AppStyles.borderRadius15,
        child:
            _buildContentItem(AppIcons.USER_ASSET, USER_PAGE, currentPage == 3),
      ),
    );
  }

  _buildContentItem(String iconUrl, String label, bool isSelectPage) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconUrl,
          color: isSelectPage
              ? AppColors.primaryColor
              : AppColors.disableTextColor,
        ),
        const SizedBox(height: 7.0),
        TextWidgets(
          text: label,
          fontSize: AppDimens.text14,
          textColor: isSelectPage
              ? AppColors.primaryColor
              : AppColors.disableTextColor,
        )
      ],
    );
  }
}
