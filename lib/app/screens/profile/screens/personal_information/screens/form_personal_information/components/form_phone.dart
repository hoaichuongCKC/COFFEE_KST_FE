import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/form_personal_information/bloc/edit_information_user_bloc.dart';
import 'package:coffee_kst/main_export.dart';

class FormPhonePI extends StatefulWidget {
  const FormPhonePI({Key? key, required this.phone}) : super(key: key);
  final String phone;
  @override
  State<FormPhonePI> createState() => _FormPhonePIState();
}

class _FormPhonePIState extends State<FormPhonePI> {
  final phoneController = TextEditingController();
  ValueNotifier<bool> isClear = ValueNotifier(false);
  String get getPhone => widget.phone;
  @override
  void initState() {
    phoneController.text = getPhone;
    phoneController.addListener(() {
      if (phoneController.text.isNotEmpty && !isClear.value) {
        isClear.value = true;
      } else if (phoneController.text.isEmpty && isClear.value) {
        isClear.value = false;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormFieldLabel(
      controller: phoneController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      isRequired: true,
      nameRequired: context.watch<EditInformationUserBloc>().state.phone.isEmpty
          ? ''
          : '(Đã chỉnh sửa)',
      hintText: 'Nhập số điện thoại của bạn',
      label: 'Số điện thoại',
      inputFormaters: [
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.digitsOnly,
      ],
      suffixIcon: ValueListenableBuilder(
          valueListenable: isClear,
          builder: (context, bool currentClear, child) {
            return Visibility(
              visible: currentClear,
              child: InkWell(
                onTap: () {
                  phoneController.text = "";
                  context
                      .read<EditInformationUserBloc>()
                      .add(const ChangedPhoneEvent(phone: ''));
                  isClear.value = false;
                },
                child: const SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: Icon(
                    Icons.clear,
                    size: 20.0,
                    color: AppColors.darkColor,
                  ),
                ),
              ),
            );
          }),
      onChanged: (value) {
        print(1);
        context
            .read<EditInformationUserBloc>()
            .add(ChangedPhoneEvent(phone: value));
      },
      validator: (value) {
        return null;
      },
    );
  }
}
