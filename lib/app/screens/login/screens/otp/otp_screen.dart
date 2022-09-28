import 'package:coffee_kst/app/screens/login/presentations/bloc/auth_phone/auth_phone_bloc.dart';
import 'package:coffee_kst/injection_container.dart';
import 'package:coffee_kst/main_export.dart';

import 'components/form_otp_screen.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthPhoneBloc>(),
      child: BgFlowLogin(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextWidgets(
                  text: 'Mã otp đã được \ngửi đến số điện\nthoại 0918031587',
                  textColor: Theme.of(context).textTheme.bodyMedium!.color!,
                  maxline: 4,
                  fontSize: AppDimens.text18,
                ),
                const SizedBox(height: 20.0),
                TextWidgets(
                  text: 'Nhập mã otp',
                  textColor: Theme.of(context).textTheme.bodyMedium!.color!,
                  maxline: 4,
                  weight: FontWeight.w600,
                  fontSize: AppDimens.text22,
                ),
                const SizedBox(height: 20.0),
                const FormPinputOTP(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
