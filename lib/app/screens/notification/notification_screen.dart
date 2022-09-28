import 'package:coffee_kst/app/common/widgets/appbar_widget.dart';
import 'package:coffee_kst/main_export.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Thông báo', context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomScrollView(
          slivers: [
            SliverAnimatedList(
              initialItemCount: 10,
              itemBuilder: (context, index, animation) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  width: 50.0,
                  height: 50.0,
                  color: AppColors.textErrorColor,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
