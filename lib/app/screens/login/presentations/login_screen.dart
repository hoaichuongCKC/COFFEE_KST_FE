import 'package:coffee_kst/app/common/overlay/success.dart';
import 'package:coffee_kst/app/common/toast/toast.dart';
import 'package:coffee_kst/app/screens/login/presentations/bloc/auth/authentication_bloc.dart';
import 'package:coffee_kst/app/screens/login/presentations/components/body_login.dart';
import 'package:coffee_kst/core/utils/const_form_state.dart';
import 'package:coffee_kst/injection_container.dart';
import 'package:coffee_kst/main_export.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocProvider(
        create: (context) => sl<AuthenticationBloc>(),
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, authState) {
            if (authState.formState is FormSubmitSuccessState) {
              context.goNamed('profile');
            } else if (authState.formState is FormSubmitFailedState) {
              Toast.show(authState.message, context, 4);
            }
          },
          builder: (context, authState) {
            return BgFlowLogin(
              overlay: authState.formState is FormSubmittingState
                  ? const SuccessOverlay(message: 'Đang xử lý')
                  : null,
              child: const SafeArea(
                child: BodyLogin(),
              ),
            );
          },
        ),
      ),
    );
  }
}
