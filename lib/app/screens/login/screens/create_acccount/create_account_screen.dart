import 'package:coffee_kst/main_export.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BgFlowLogin(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextWidgets(
                text: 'Tạo tài khoản mới \n cho người mới',
                textColor: Theme.of(context).textTheme.bodyMedium!.color!,
                maxline: 4,
                fontSize: AppDimens.text18,
              ),
              const SizedBox(height: 20.0),
              TextWidgets(
                text: 'Tạo tài khoản',
                textColor: Theme.of(context).textTheme.bodyMedium!.color!,
                maxline: 4,
                weight: FontWeight.w600,
                fontSize: AppDimens.text22,
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
