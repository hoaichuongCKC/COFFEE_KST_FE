import 'package:coffee_kst/main_export.dart';

class FormFullNamePI extends StatefulWidget {
  const FormFullNamePI({Key? key}) : super(key: key);

  @override
  State<FormFullNamePI> createState() => _FormFullNamePIState();
}

class _FormFullNamePIState extends State<FormFullNamePI> {
  final fullnameController = TextEditingController();
  ValueNotifier<bool> isClear = ValueNotifier(false);
  @override
  void initState() {
    fullnameController.addListener(() {
      if (fullnameController.text.isNotEmpty && !isClear.value) {
        isClear.value = true;
      } else if (fullnameController.text.isEmpty && isClear.value) {
        isClear.value = false;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    fullnameController.dispose();
    isClear.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormFieldLabel(
      controller: fullnameController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      hintText: 'Nhập họ tên của bạn',
      label: 'Họ và tên',
      suffixIcon: ValueListenableBuilder(
          valueListenable: isClear,
          builder: (context, bool currentClear, child) {
            return Visibility(
              visible: currentClear,
              child: InkWell(
                onTap: () {
                  fullnameController.text = "";
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
