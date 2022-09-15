import 'package:coffee_kst/app/screens/login/data/datasource/auth_login_remote_datasource.dart';
import 'package:coffee_kst/app/screens/login/data/repositories/auth_login_repository_impl.dart';
import 'package:coffee_kst/app/screens/login/domain/repositories/auth_login_repository.dart';
import 'package:coffee_kst/app/screens/login/domain/usecases/auth_login.dart';
import 'package:coffee_kst/app/screens/login/presentations/bloc/auth/authentication_bloc.dart';
import 'package:coffee_kst/core/network/network_info.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - AuthenticationBloc
  // Bloc
  sl.registerFactory(
    () => AuthenticationBloc(authLoginUsecases: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => AuthLoginUsecases(sl()));
  // sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));

  // Repository
  sl.registerLazySingleton(
    () => AuthLoginRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()),
  );
  sl.registerLazySingleton<AuthLoginRepository>(
    () => AuthLoginRepositoryImpl(
      // localDataSource: sl(),
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AuthLoginRemoteDataSource>(
    () => AuthLoginRemoteDataSourceImpl(),
  );

  // sl.registerLazySingleton<NumberTriviaLocalDataSource>(
  //   () => NumberTriviaLocalDataSourceImpl(sharedPreferences: sl()),
  // );

  // //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // //! External
  sl.registerLazySingleton(() => Connectivity());
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => http.Client());
  // sl.registerLazySingleton(() => DataConnectionChecker());
}
