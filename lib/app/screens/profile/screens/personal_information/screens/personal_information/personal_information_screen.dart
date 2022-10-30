import 'package:coffee_kst/app/common/toast/toast.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/personal_information/bloc/update_avatar/update_avatar_bloc.dart';
import 'package:coffee_kst/injection_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:coffee_kst/app/common/components/avatar_big.dart';
import 'package:coffee_kst/app/common/widgets/appbar_widget.dart';
import 'package:coffee_kst/core/locale_keys.g.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:coffee_kst/routes/routes.dart';
import 'components/body_information.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UpdateAvatarBloc>(),
      child: Scaffold(
        appBar: AppBarWidget(
          title: LocaleKeys.personal_information.tr(),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: InkWell(
                onTap: () => AppRoutes.pushNamed(EDIT_PATH_PROFILE_INFORMATION),
                child: Icon(
                  Icons.edit,
                  size: 20.0,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            )
          ],
          context: context,
        ),
        body: BlocListener<UpdateAvatarBloc, UpdateAvatarState>(
          listener: (context, state) {
            if (state.state is UploadingState) {
              showLoading(context);
              // Future.delayed(const Duration(seconds: 3), () {
              //   showDialogSuccess(context);
              // });
              // AppRoutes.pop();
              context.read<UpdateAvatarBloc>().add(UploadFileFirebaseEvent());
            } else if (state.state is UploadFailedState) {
              Toast.show('Đã có lỗi xảy ra', context, 4);
            } else if (state.state is UploadSuccessState) {
              showDialogSuccess(context);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Builder(builder: (context) {
                return Center(
                  child: AvatarUserBig(
                    isIconCamera: true,
                    onClicked: () {
                      context.read<UpdateAvatarBloc>().add(SelectFileEvent());
                    },
                  ),
                );
              }),
              const SizedBox(height: 25.0),
              const BodyPersonalInformation(),
            ],
          ),
        ),
      ),
    );
  }

  showLoading(BuildContext context) => showDialog(
        context: context,
        builder: (context) => Dialog(
          elevation: 10.0,
          shape: const RoundedRectangleBorder(
            borderRadius: AppStyles.borderRadius12,
          ),
          backgroundColor: AppColors.lightColor,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            constraints: const BoxConstraints(
              minWidth: 80,
              minHeight: 80,
              maxHeight: 100,
              maxWidth: 100,
            ),
            alignment: Alignment.center,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loading,
                  const SizedBox(height: 6.0),
                  TextWidgets(
                    text: 'Vui lòng đợi',
                    fontSize: AppDimens.text14,
                    textColor: AppColors.darkColor,
                  )
                ],
              ),
            ),
          ),
        ),
      );
  showDialogSuccess(BuildContext context) => showDialog(
        context: context,
        builder: (context) => Dialog(
          elevation: 10.0,
          shape: const RoundedRectangleBorder(
            borderRadius: AppStyles.borderRadius12,
          ),
          backgroundColor: AppColors.lightColor,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            constraints: const BoxConstraints(
              minWidth: 80,
              minHeight: 80,
              maxHeight: 100,
              maxWidth: 100,
            ),
            alignment: Alignment.center,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.SUCCESS_ASSET),
                  const SizedBox(height: 6.0),
                  TextWidgets(
                    text: 'Thay đổi ảnh thành công',
                    fontSize: AppDimens.text14,
                    textColor: AppColors.darkColor,
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
