import 'package:coffee_kst/app/screens/profile/screens/change_password/bloc/change_password_bloc.dart';

import 'package:coffee_kst/injection_container.dart';
import 'package:coffee_kst/main_export.dart';

class FormNewPassword extends StatefulWidget {
  const FormNewPassword(
      {Key? key, required this.controller, required this.controller2})
      : super(key: key);
  final TextEditingController controller;
  final TextEditingController controller2;
  @override
  State<FormNewPassword> createState() => _FormNewPasswordState();
}

class _FormNewPasswordState extends State<FormNewPassword> {
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
              label: 'Mật khẩu mới',
              isRequired: true,
              obscureText: currentIsVisibility,
              controller: widget.controller,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              onChanged: (value) => context
                  .read<ChangePasswordBloc>()
                  .add(ChangedNewPasswordEvent(newPassword: value)),
              hintText: 'Nhập mật khẩu mới của bạn',
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
                if (value!.isEmpty) {
                  return MESSAGE_ERROR_VALIDATE_ISEMPTY;
                }
                // if (!widget.controller.text.isSpecialCharacters()) {
                //   return 'Mật khẩu phải chứ kí tự @-=. và 1 chữ cái viết hoa.';
                // }
                if (widget.controller.text != widget.controller2.text) {
                  return 'Hai mật khẩu không trùng khớp!';
                }

                return null;
              });
        });
  }
}
