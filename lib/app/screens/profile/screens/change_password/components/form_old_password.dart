import 'package:coffee_kst/app/screens/profile/screens/change_password/bloc/change_password_bloc.dart';
import 'package:coffee_kst/injection_container.dart';
import 'package:coffee_kst/main_export.dart';

class FormOldPassword extends StatefulWidget {
  const FormOldPassword({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  @override
  State<FormOldPassword> createState() => _FormOldPasswordState();
}

class _FormOldPasswordState extends State<FormOldPassword> {
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
        builder: (context1, bool currentIsVisibility, child) {
          return TextFormFieldLabel(
              label: 'Mật khẩu cũ',
              isRequired: true,
              obscureText: currentIsVisibility,
              controller: widget.controller,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              onChanged: (value) => context
                  .read<ChangePasswordBloc>()
                  .add(ChangedOldPasswordEvent(oldPassword: value)),
              hintText: 'Nhập mật khẩu hiện tại',
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
                return null;
              });
        });
  }
}
