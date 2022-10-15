import 'package:coffee_kst/app/screens/dashboard/presentation/bloc/tab_categ/change_tab_categ_cubit.dart';
import 'package:coffee_kst/main_export.dart';

import 'components/tabbar_dashboard.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: TextWidgets(
            text: 'Danh mục',
            fontSize: AppDimens.text22,
            textColor: AppColors.darkColor,
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: TabbarDashBoard(),
          ),
          actions: <Widget>[
            SvgPicture.asset(AppIcons.SEARCH_ASSET),
            const SizedBox(width: 10.0),
            SvgPicture.asset(AppIcons.FILTER_ASSET),
            const SizedBox(width: 10.0),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[],
        ),
      ),
    );
  }
}
