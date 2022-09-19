import 'package:coffee_kst/app/screens/profile/screens/change_password/bloc/change_password_bloc.dart';
import 'package:coffee_kst/main_export.dart';

class ButtonChangePassword extends StatelessWidget {
  const ButtonChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonWidget(
        label: 'Thay đổi',
        onClicked: () {
          context
              .read<ChangePasswordBloc>()
              .add(SubmitFormChangePasswordEvent());
        },
      ),
    );
  }
}
