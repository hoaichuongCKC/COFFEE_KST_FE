import 'package:coffee_kst/app/screens/dashboard/presentation/bloc/tab_categ/change_tab_categ_cubit.dart';
import 'package:coffee_kst/app/screens/dashboard/presentation/widget/item_tabbar_dashboard.dart';
import 'package:coffee_kst/core/utils/home.dart';
import 'package:coffee_kst/main_export.dart';

class TabbarDashBoard extends StatefulWidget {
  const TabbarDashBoard({Key? key}) : super(key: key);

  @override
  State<TabbarDashBoard> createState() => _TabbarDashBoardState();
}

class _TabbarDashBoardState extends State<TabbarDashBoard>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _animationController;
  ValueNotifier<Offset> offData = ValueNotifier<Offset>(Offset.zero);
  final GlobalKey _keyAll = GlobalKey();
  final GlobalKey _keyCoffee = GlobalKey();
  final GlobalKey _keyCake = GlobalKey();
  final GlobalKey _keyTea = GlobalKey();
  final GlobalKey _keySeller = GlobalKey();
  late ChangeTabCategCubit _changeTabCategCubit;
  @override
  void initState() {
    _changeTabCategCubit = BlocProvider.of(context, listen: false);
    _inititalAnimation();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        _setupIndicator();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _inititalAnimation() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _animation = Tween<double>(begin: 0, end: 0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastLinearToSlowEaseIn));
  }

  _setupIndicator() {
    late GlobalKey mykey;
    switch (_changeTabCategCubit.state.currentTab) {
      case ALL:
        mykey = _keyAll;
        break;
      case COFFEE_TYPE:
        mykey = _keyCoffee;
        break;
      case TEA_TYPE:
        mykey = _keyTea;
        break;
      case CAKE_TYPE:
        mykey = _keyCake;
        break;
      default:
    }
    final renderBox = mykey.currentContext!.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    print('offset: ${offset.dx}');
    print('offset: ${renderBox.size.width}');
    print('offset: ${renderBox.size.height}');
    _animation = Tween<double>(begin: 0, end: offset.dx).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Curves.fastLinearToSlowEaseIn));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withAlpha(100),
                  borderRadius: AppStyles.borderRadius10,
                ),
                width: 100,
                height: 50.0,
              ),
              builder: (context, child) {
                print(_animation.value);
                return AnimatedPositioned(
                  top: 0.0,
                  left: _animation.value,
                  duration: const Duration(milliseconds: 500),
                  child: child!,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ItemCategDashboard(
                    key: _keyAll,
                    iconUrl: AppIcons.HOME_ASSET,
                    label: ALL,
                    onClicked: () {},
                  ),
                  ItemCategDashboard(
                    key: _keyCoffee,
                    iconUrl: AppIcons.CATEG_COFFEE_ASSET,
                    label: COFFEE_TYPE,
                    onClicked: () {},
                  ),
                  ItemCategDashboard(
                    key: _keyCake,
                    iconUrl: AppIcons.CATEG_TEA_ASSET,
                    label: TEA_TYPE,
                    onClicked: () {},
                  ),
                  ItemCategDashboard(
                    key: _keyTea,
                    iconUrl: AppIcons.CATEG_CAKE_ASSET,
                    label: CAKE_TYPE,
                    onClicked: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
