import 'package:coffee_kst/main_export.dart';

class FormPhonePI extends StatefulWidget {
  const FormPhonePI({Key? key}) : super(key: key);

  @override
  State<FormPhonePI> createState() => _FormPhonePIState();
}

class _FormPhonePIState extends State<FormPhonePI> {
  final phoneController = TextEditingController();
  ValueNotifier<bool> isClear = ValueNotifier(false);

  @override
  void initState() {
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
      hintText: 'Nhập số điện thoại của bạn',
      label: 'Số điện thoại',
      suffixIcon: ValueListenableBuilder(
          valueListenable: isClear,
          builder: (context, bool currentClear, child) {
            return Visibility(
              visible: currentClear,
              child: InkWell(
                onTap: () {
                  phoneController.text = "";
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
      onChanged: (value) {},
      validator: (value) {
        return null;
      },
    );
  }
}
