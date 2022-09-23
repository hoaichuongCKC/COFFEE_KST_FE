import 'package:coffee_kst/main_export.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: TextWidgets(
              text: 'Dashboard Page',
              textColor: Theme.of(context).textTheme.bodyMedium!.color!,
            ),
          )
        ],
      ),
    );
  }
}
