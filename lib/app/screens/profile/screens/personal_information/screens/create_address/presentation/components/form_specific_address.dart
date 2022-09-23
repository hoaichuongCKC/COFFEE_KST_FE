import 'package:coffee_kst/app/common/widgets/text_form_widget.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/presentation/bloc/address_country/address_country_bloc.dart';
import 'package:coffee_kst/core/locale_keys.g.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:easy_localization/easy_localization.dart';

class FormSpecificAddress extends StatefulWidget {
  const FormSpecificAddress({Key? key}) : super(key: key);

  @override
  State<FormSpecificAddress> createState() => _FormSpecificAddressState();
}

class _FormSpecificAddressState extends State<FormSpecificAddress> {
  final specificAddressController = TextEditingController();
  ValueNotifier<bool> isClear = ValueNotifier(false);
  @override
  void initState() {
    specificAddressController.addListener(() {
      if (specificAddressController.text.isNotEmpty && !isClear.value) {
        isClear.value = true;
      } else if (specificAddressController.text.isEmpty && isClear.value) {
        isClear.value = false;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    specificAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidgets(
              text: LocaleKeys.specific_address.tr(),
              fontSize: AppDimens.text18,
              weight: FontWeight.w400,
              textColor: Theme.of(context).textTheme.bodyMedium!.color!,
            ),
            context.watch<AddressCountryBloc>().state.specificAddress.isEmpty
                ? const SizedBox()
                : const Icon(Icons.check_circle,
                    size: 15.0, color: Colors.green),
          ],
        ),
        const SizedBox(height: 8.0),
        TextFormFielddWidget.outlineBorder(
          onChanged: (value) {
            context
                .read<AddressCountryBloc>()
                .add(ChangedSpecificAddressEvent(specificAddress: value));
          },
          maxLine: 3,
          hintText: 'vd: 12 Hồ Thành Biên...',
          keyboardType: TextInputType.streetAddress,
          textInputAction: TextInputAction.newline,
          controller: specificAddressController,
          outlineColor: Theme.of(context).brightness == Brightness.light
              ? AppColors.primaryColor
              : AppColors.lightColor,
          suffixIcon: ValueListenableBuilder(
              valueListenable: isClear,
              builder: (context, bool currentClear, child) {
                return Visibility(
                  visible: currentClear,
                  child: InkWell(
                    onTap: () {
                      specificAddressController.text = "";
                      context.read<AddressCountryBloc>().add(
                          const ChangedSpecificAddressEvent(
                              specificAddress: ''));
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
        )
      ],
    );
  }
}
