import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/form_personal_information/bloc/edit_information_user_bloc.dart';
import 'package:coffee_kst/core/locale_keys.g.dart';
import 'package:coffee_kst/main_export.dart';

class FormFullNamePI extends StatefulWidget {
  const FormFullNamePI({Key? key, required this.fullname}) : super(key: key);
  final String fullname;
  @override
  State<FormFullNamePI> createState() => _FormFullNamePIState();
}

class _FormFullNamePIState extends State<FormFullNamePI> {
  final fullnameController = TextEditingController();
  String get getFullname => widget.fullname;
  ValueNotifier<bool> isClear = ValueNotifier(false);
  @override
  void initState() {
    fullnameController.text = getFullname;
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
      isRequired: true,
      nameRequired:
          context.watch<EditInformationUserBloc>().state.fullname.isEmpty
              ? ''
              : '(Đã chỉnh sửa)',
      hintText: 'Nhập họ tên của bạn',
      label: LocaleKeys.fullname,
      suffixIcon: ValueListenableBuilder(
          valueListenable: isClear,
          builder: (context, bool currentClear, child) {
            return Visibility(
              visible: currentClear,
              child: InkWell(
                onTap: () {
                  fullnameController.text = "";
                  context
                      .read<EditInformationUserBloc>()
                      .add(const ChangedFullnameEvent(fullname: ''));
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
        context
            .read<EditInformationUserBloc>()
            .add(ChangedFullnameEvent(fullname: value));
      },
      validator: (value) {
        return null;
      },
    );
  }
}
