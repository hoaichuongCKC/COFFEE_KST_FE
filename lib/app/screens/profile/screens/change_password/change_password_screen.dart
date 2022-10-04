import 'package:coffee_kst/app/common/dialog/dialog_controller.dart';
import 'package:coffee_kst/app/common/widgets/appbar_widget.dart';
import 'package:coffee_kst/app/screens/profile/screens/change_password/bloc/change_password_bloc.dart';
import 'package:coffee_kst/app/screens/profile/screens/change_password/components/form_confirm_password.dart';
import 'package:coffee_kst/app/screens/profile/screens/change_password/components/form_new_password.dart';
import 'package:coffee_kst/core/locale_keys.g.dart';
import 'package:coffee_kst/core/utils/const_form_state.dart';
import 'package:coffee_kst/injection_container.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'components/form_old_password.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final newPass = TextEditingController();
  final oldPass = TextEditingController();
  final confirmPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocProvider(
        create: (context) => sl<ChangePasswordBloc>(),
        child: Scaffold(
          appBar: AppBarWidget(
            title: LocaleKeys.change_password.tr(),
            context: context,
          ),
          bottomNavigationBar: Builder(builder: (context) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: ButtonWidget(
                label: LocaleKeys.confirm.tr(),
                onClicked: () {
                  if (formKey.currentState!.validate()) {
                    context
                        .read<ChangePasswordBloc>()
                        .add(SubmitFormChangePasswordEvent());
                  }
                },
              ),
            );
          }),
          body: Builder(builder: (context) {
            return BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
              listener: (context, state) {
                if (state.formAppState is FormSubmitSuccessState) {
                  oldPass.text = '';
                  newPass.text = '';
                  confirmPass.text = '';
                  context
                      .read<ChangePasswordBloc>()
                      .add(InitChangedPasswordEvent());
                  DialogController.instance
                      .success(message: state.message, context: context);
                }
                if (state.formAppState is FormSubmitFailedState) {
                  DialogController.instance
                      .failed(message: state.message, context: context);
                }
              },
              listenWhen: (previous, current) =>
                  current.formAppState is FormSubmitFailedState ||
                  current.formAppState is FormSubmitSuccessState,
              builder: (context, changePassState) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    _buildBody(context),
                  ],
                );
              },
            );
          }),
        ),
      ),
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FormOldPassword(controller: oldPass),
              const SizedBox(height: 20.0),
              FormNewPassword(
                controller: newPass,
                controller2: confirmPass,
              ),
              const SizedBox(height: 20.0),
              FormConfirmPassword(
                controller: confirmPass,
                controller2: newPass,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
