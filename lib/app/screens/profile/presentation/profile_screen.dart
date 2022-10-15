import 'package:coffee_kst/app/screens/profile/presentation/bloc/personal_information_bloc.dart';
import 'package:coffee_kst/app/screens/profile/presentation/components/body_profile.dart';
import 'package:coffee_kst/app/screens/profile/presentation/components/header_profile.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loading = SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: ShapeDecoration(
            color: index.isEven
                ? (Theme.of(context).brightness == Brightness.light)
                    ? AppColors.borderAvatarColor
                    : AppColors.lightColor
                : AppColors.primaryColor,
            shape: const CircleBorder(),
          ),
        );
      },
    );
    return Scaffold(
      body: Builder(builder: (context) {
        return BlocBuilder<PersonalInformationBloc, PersonalInformationState>(
          builder: (context, state) {
            if (state is PIFailedState) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidgets(
                      text: state.message,
                      fontSize: AppDimens.text14,
                      textColor: Theme.of(context).textTheme.bodyMedium!.color!,
                    ),
                    const SizedBox(height: 10.0),
                    InkWell(
                      onTap: () => context
                          .read<PersonalInformationBloc>()
                          .add(LoadPIEvent()),
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          child: TextWidgets(
                            text: 'Kết nối lại',
                            fontSize: AppDimens.text16,
                            textColor: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
            if (state is PILoadingState) {
              return Center(
                child: loading,
              );
            }
            if (state is PILoadedState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  HeaderProfileWidget(),
                  BodyProfile(),
                ],
              );
            }
            return const SizedBox();
          },
        );
      }),
    );
  }
}
