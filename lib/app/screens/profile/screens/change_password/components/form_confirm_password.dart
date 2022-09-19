import 'package:coffee_kst/app/screens/profile/screens/change_password/bloc/change_password_bloc.dart';
import 'package:coffee_kst/main_export.dart';

class FormConfirmPassword extends StatefulWidget {
  const FormConfirmPassword(
      {Key? key, required this.controller, required this.controller2})
      : super(key: key);
  final TextEditingController controller;
  final TextEditingController controller2;
  @override
  State<FormConfirmPassword> createState() => _FormConfirmPasswordState();
}

class _FormConfirmPasswordState extends State<FormConfirmPassword> {
  ValueNotifier<bool> isVisibility = ValueNotifier(true);
  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
    isVisibility.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isVisibility,
        builder: (context, bool currentIsVisibility, child) {
          return TextFormFieldLabel(
              label: 'Xác nhận mật khẩu',
              isRequired: true,
              obscureText: currentIsVisibility,
              controller: widget.controller,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              onChanged: (value) => context
                  .read<ChangePasswordBloc>()
                  .add(ChangedConfirmPasswordEvent(confirmPassword: value)),
              hintText: 'Nhập lại mật khẩu mới',
              suffixIcon: InkWell(
                onTap: () {
                  isVisibility.value = !isVisibility.value;
                },
                child: SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: Icon(
                    currentIsVisibility
                        ? Icons.visibility_off
                        : Icons.visibility,
                    size: 20.0,
                    color: AppColors.darkColor,
                  ),
                ),
              ),
              validator: (value) {
                if (widget.controller.text != widget.controller2.text) {
                  return 'Hai mật khẩu không trùng khớp!';
                }
                if (value!.isEmpty) {
                  return MESSAGE_ERROR_VALIDATE_ISEMPTY;
                }
                return null;
              });
        });
  }
}
