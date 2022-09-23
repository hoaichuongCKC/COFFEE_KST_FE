import 'package:coffee_kst/app/common/dialog/dialog_controller.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/presentation/bloc/address_country/address_country_bloc.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/form_personal_information/bloc/edit_information_user_bloc.dart';
import 'package:coffee_kst/core/locale_keys.g.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'components/body_create_address.dart';

class CreateAddressScreen extends StatelessWidget {
  const CreateAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AddressCountryBloc>().state;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              if (bloc.provinceEntity.name.isEmpty &&
                  bloc.districtEntity.name.isEmpty &&
                  bloc.communeEntity.name.isEmpty) {
                Navigator.of(context).pop();
              } else {
                DialogController.instance.warning(
                  message:
                      'Nếu bạn quay lại thì các lựa chọn địa chỉ của bạn sẽ mất',
                  context: context,
                  onCancle: () {
                    Navigator.of(context).pop();
                  },
                  onConfirm: () {
                    context.read<AddressCountryBloc>().add(LoadAddressInit());
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                );
              }
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 20.0,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          title: TextWidgets(
            text: 'Chỉnh sửa địa chỉ',
            fontSize: AppDimens.text20,
            textColor: Theme.of(context).textTheme.titleSmall!.color!,
            weight: FontWeight.w600,
          ),
        ),
        body: const BodyCreateAddress(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
          child: ButtonWidget(
              label: LocaleKeys.update.tr(),
              onClicked: bloc.provinceEntity.name.isEmpty ||
                      bloc.districtEntity.name.isEmpty ||
                      bloc.communeEntity.name.isEmpty
                  ? null
                  : () {
                      context.read<EditInformationUserBloc>().add(
                            ChangedAddressNewEvent(
                                address:
                                    '${bloc.specificAddress}, ${bloc.communeEntity.name}, ${bloc.districtEntity.name}, ${bloc.provinceEntity.name}'),
                          );
                      context.read<AddressCountryBloc>().add(LoadAddressInit());
                      Navigator.of(context).pop();
                    }),
        ),
      ),
    );
  }
}
