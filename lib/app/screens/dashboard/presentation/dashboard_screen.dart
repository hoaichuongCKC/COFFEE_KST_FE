import 'package:coffee_kst/app/screens/dashboard/presentation/components/appbar_dash.dart';
import 'package:coffee_kst/app/screens/dashboard/presentation/components/body_load_list.dart';
import 'package:coffee_kst/main_export.dart';

import 'components/list_tabbar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const AppBarDashBoard(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ListTabbarCateg(),
                  Container(
                    height: 10,
                    color: AppColors.disableTextColor.withAlpha(30),
                  ),
                  const Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: BodyLoadList(),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
