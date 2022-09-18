import 'package:coffee_kst/app/screens/profile/presentation/bloc/personal_information_bloc.dart';
import 'package:coffee_kst/app/screens/profile/presentation/components/body_profile.dart';
import 'package:coffee_kst/app/screens/profile/presentation/components/header_profile.dart';
import 'package:coffee_kst/injection_container.dart';
import 'package:coffee_kst/main_export.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<PersonalInformationBloc>()..add(LoadPIEvent()),
        child: Builder(builder: (context) {
          return BlocBuilder<PersonalInformationBloc, PersonalInformationState>(
            builder: (context, state) {
              if (state is PIFailedState) {
                return Center(
                  child: TextWidgets(
                    text: state.message,
                    fontSize: AppDimens.text14,
                  ),
                );
              }
              if (state is PILoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PILoadedState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    HeaderProfileWidget(
                      nameUser: state.userEntity.fullname,
                      phone: state.userEntity.phone,
                    ),
                    BodyProfile(userEntity: state.userEntity),
                  ],
                );
              }
              return const SizedBox();
            },
          );
        }),
      ),
    );
  }
}
