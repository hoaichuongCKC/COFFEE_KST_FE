import 'package:coffee_kst/app/screens/login/data/datasource/auth_login_remote_datasource.dart';
import 'package:coffee_kst/app/screens/login/data/repositories/auth_login_repository_impl.dart';
import 'package:coffee_kst/app/screens/login/domain/repositories/auth_login_repository.dart';
import 'package:coffee_kst/app/screens/login/domain/usecases/auth_login.dart';
import 'package:coffee_kst/app/screens/login/domain/usecases/auth_otp.dart';
import 'package:coffee_kst/app/screens/login/presentations/bloc/auth/authentication_bloc.dart';
import 'package:coffee_kst/app/screens/profile/data/datasource/user_remote_datasource.dart';
import 'package:coffee_kst/app/screens/profile/data/repositories/user_repository_impl.dart';
import 'package:coffee_kst/app/screens/profile/domain/repositories/profile_repository.dart';
import 'package:coffee_kst/app/screens/profile/domain/usecases/change_password_user.dart';
import 'package:coffee_kst/app/screens/profile/domain/usecases/get_information_user.dart';
import 'package:coffee_kst/app/screens/profile/presentation/bloc/personal_information_bloc.dart';
import 'package:coffee_kst/app/screens/profile/screens/change_password/bloc/change_password_bloc.dart';
import 'package:coffee_kst/core/network/network_info.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - AuthenticationBloc
  // Bloc
  sl.registerFactory(
    () => AuthenticationBloc(
      authLoginUsecases: sl(),
      authLoginOTPUsecases: sl(),
    ),
  );

  // Use cases - Authentication
  sl.registerLazySingleton(() => AuthLoginUsecases(sl()));
  sl.registerLazySingleton(() => AuthOTPUsecases(sl()));

  // Repository - Authentication
  sl.registerLazySingleton(
    () => AuthLoginRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()),
  );
  sl.registerLazySingleton<AuthLoginRepository>(
    () => AuthLoginRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources - Authentication
  sl.registerLazySingleton<AuthLoginRemoteDataSource>(
    () => AuthLoginRemoteDataSourceImpl(),
  );

  //---------------------------------------------------
  //Feature UserController
  sl.registerFactory(
    () => PersonalInformationBloc(
      getInformationUserUsecases: sl(),
    ),
  );
  sl.registerFactory(
    () => ChangePasswordBloc(
      changePasswordUserUsecases: sl(),
    ),
  );
  //Use cases - UserController
  sl.registerLazySingleton(() => GetInformationUserUsecases(sl()));
  sl.registerLazySingleton(() => ChangePasswordUserUsecases(sl()));
  // Repository - UserController
  sl.registerLazySingleton(
    () => UserRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  //data source -UserController
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(),
  );
  //---------------------------------------------------------
  // //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // //! External
  sl.registerLazySingleton(() => Connectivity());
}
