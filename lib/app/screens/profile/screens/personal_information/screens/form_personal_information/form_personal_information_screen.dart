import 'package:coffee_kst/app/common/dialog/dialog_controller.dart';
import 'package:coffee_kst/app/common/overlay/loading.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/form_personal_information/bloc/edit_information_user_bloc.dart';
import 'package:coffee_kst/core/locale_keys.g.dart';
import 'package:coffee_kst/core/utils/const_form_state.dart';
import 'package:coffee_kst/core/utils/constants_profile.dart';
import 'package:coffee_kst/database/box/information_user.dart';
import 'package:coffee_kst/database/hive/infor_user/infor_user.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'components/form_fullname.dart';
import 'components/form_phone.dart';
import 'components/personal_gender.dart';
import 'components/select_box_address.dart';

class FormPersonalInformationScreen extends StatelessWidget {
  const FormPersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (context) {
            final bloc = context.watch<EditInformationUserBloc>().state;
            return InkWell(
              onTap: () {
                if (bloc.address.isNotEmpty ||
                    bloc.fullname.isNotEmpty ||
                    bloc.phone.isNotEmpty ||
                    bloc.gender.isNotEmpty) {
                  DialogController.instance.warning(
                    message: 'Bạn có chắc muốn thoát?',
                    context: context,
                    onCancle: () {
                      Navigator.of(context).pop();
                    },
                    onConfirm: () {
                      context
                          .read<EditInformationUserBloc>()
                          .add(ChangedEditInitial());
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                  );
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 20.0,
                color: Theme.of(context).iconTheme.color,
              ),
            );
          }),
          title: TextWidgets(
            text: 'Chỉnh sửa thông tin',
            fontSize: AppDimens.text20,
            textColor: Theme.of(context).textTheme.titleSmall!.color!,
            weight: FontWeight.w600,
          ),
        ),
        bottomNavigationBar: Builder(builder: (context) {
          return Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Builder(builder: (context) {
              final bloc = context.watch<EditInformationUserBloc>().state;
              return ButtonWidget(
                label: 'Hoàn thành',
                onClicked: bloc.address.isEmpty &&
                        bloc.fullname.isEmpty &&
                        bloc.phone.isEmpty &&
                        bloc.gender.isEmpty
                    ? null
                    : () {
                        context
                            .read<EditInformationUserBloc>()
                            .add(SubmitEditInformationUser());
                      },
              );
            }),
          );
        }),
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: ValueListenableBuilder<Box<InformationUserHive>>(
                  valueListenable:
                      Hive.box<InformationUserHive>(NAME_BOX_INFORMATION)
                          .listenable(),
                  builder: (context, Box<InformationUserHive> box, child) {
                    final user = box.get(KEY_BOX_INFORMATION);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FormFullNamePI(
                          fullname: user!.fullname,
                        ),
                        const SizedBox(height: 16.0),
                        FormPhonePI(phone: user.phone),
                        const SizedBox(height: 16.0),
                        SelectBoxAddressPI(address: user.full_address),
                        const SizedBox(height: 16.0),
                        GenderPersonalPI(
                            gender: user.gender == PersonalGender.MALE.name
                                ? PersonalGender.MALE
                                : user.gender == PersonalGender.FEMALE.name
                                    ? PersonalGender.FEMALE
                                    : PersonalGender.ANOTHER),
                      ],
                    );
                  },
                ),
              ),
            ),
            overlayHandle,
          ],
        ),
      ),
    );
  }

  Widget get overlayHandle {
    return BlocConsumer<EditInformationUserBloc, EditInformationUserState>(
      listenWhen: (previous, current) =>
          current.state is FormSubmitFailedState ||
          current.state is FormSubmitSuccessState,
      listener: (context, state) {
        if (state.state is FormSubmitSuccessState) {
          DialogController.instance.success(
              message: LocaleKeys.edit_successfully.tr(),
              context: context,
              onClicked: () {
                Navigator.pop(context);
                Navigator.pop(context);
              });
        }
        if (state.state is FormSubmitFailedState) {
          DialogController.instance
              .failed(message: state.message, context: context);
        }
      },
      builder: (context, state) {
        if (state.state is FormSubmittingState) {
          return Align(
            alignment: Alignment.center,
            child: LoadingOverlay(
              message: LocaleKeys.processing.tr(),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
