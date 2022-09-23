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
import 'package:coffee_kst/app/screens/profile/domain/usecases/edit_information_user.dart';
import 'package:coffee_kst/app/screens/profile/domain/usecases/get_information_user.dart';
import 'package:coffee_kst/app/screens/profile/presentation/bloc/personal_information_bloc.dart';
import 'package:coffee_kst/app/screens/profile/screens/change_password/bloc/change_password_bloc.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/data/datasource/address_remote_datasource.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/data/repositories/address_repository_impl.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/repositories/address_repository.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/usecases/get_commnue.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/usecases/get_district.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/domain/usecases/get_province.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/create_address/presentation/bloc/address_country/address_country_bloc.dart';
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/form_personal_information/bloc/edit_information_user_bloc.dart';
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
  sl.registerFactory(
    () => AddressCountryBloc(
      getProvinceUseCase: sl(),
      getCommuneUsecase: sl(),
      getDistrictUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => EditInformationUserBloc(editInformationUserUsecases: sl()),
  );
  //Use cases - UserController
  sl.registerLazySingleton(() => GetInformationUserUsecases(sl()));
  sl.registerLazySingleton(() => ChangePasswordUserUsecases(sl()));
  sl.registerLazySingleton(() => GetProvinceUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetDistrictUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetCommuneUsecase(repository: sl()));
  sl.registerLazySingleton(() => EditInformationUserUsecases(sl()));
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
  sl.registerLazySingleton<AddressRepository>(
    () => AddressRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  //data source -UserController
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<AddressRemoteDataSource>(
    () => AddressRemoteDataSourceImpl(),
  );
  //---------------------------------------------------------
  // //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // //! External
  sl.registerLazySingleton(() => Connectivity());
}
