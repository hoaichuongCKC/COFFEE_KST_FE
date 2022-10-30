import 'package:coffee_kst/app/screens/cart/data/datasource/invoice_remote_datasource.dart';
import 'package:coffee_kst/app/screens/cart/data/repositories/invoice_repository_impl.dart';
import 'package:coffee_kst/app/screens/cart/domain/repositories/invoice_repository.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/add_to_cart.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/add_to_cart_is_not_empty.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/get_cart.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/remove_cart.dart';
import 'package:coffee_kst/app/screens/cart/presentation/bloc/bloc_cart/cart_bloc.dart';
import 'package:coffee_kst/app/screens/detail/data/datasource/detail_remote_datasource.dart';
import 'package:coffee_kst/app/screens/detail/data/repositories/detail_repositories_impl.dart';
import 'package:coffee_kst/app/screens/detail/domain/repositories/home_repository.dart';
import 'package:coffee_kst/app/screens/detail/domain/usecase/get_detail.dart';
import 'package:coffee_kst/app/screens/detail/presentation/bloc/detail_service/product_detail_bloc.dart';
import 'package:coffee_kst/app/screens/home/data/datasource/home_remote_datasource.dart';
import 'package:coffee_kst/app/screens/home/data/repositories/home_repositories_impl.dart';
import 'package:coffee_kst/app/screens/home/domain/repositories/home_repository.dart';
import 'package:coffee_kst/app/screens/home/domain/usecase/get_list_product.dart';
import 'package:coffee_kst/app/screens/home/domain/usecase/get_product_type.dart';
import 'package:coffee_kst/app/screens/home/domain/usecase/get_voucher.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/navigation_bottom/navigation_screen_cubit.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/product/product_bloc.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/product_type/product_type_bloc.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/voucher/voucher_bloc.dart';
import 'package:coffee_kst/app/screens/login/data/datasource/auth_login_remote_datasource.dart';
import 'package:coffee_kst/app/screens/login/data/repositories/auth_login_repository_impl.dart';
import 'package:coffee_kst/app/screens/login/domain/repositories/auth_login_repository.dart';
import 'package:coffee_kst/app/screens/login/domain/usecases/auth_login.dart';
import 'package:coffee_kst/app/screens/login/presentations/bloc/auth/authentication_bloc.dart';
import 'package:coffee_kst/app/screens/login/presentations/bloc/auth_phone/auth_phone_bloc.dart';
import 'package:coffee_kst/app/screens/profile/data/datasource/user_remote_datasource.dart';
import 'package:coffee_kst/app/screens/profile/data/repositories/user_repository_impl.dart';
import 'package:coffee_kst/app/screens/profile/domain/repositories/profile_repository.dart';
import 'package:coffee_kst/app/screens/profile/domain/usecases/change_password_user.dart';
import 'package:coffee_kst/app/screens/profile/domain/usecases/edit_information_user.dart';
import 'package:coffee_kst/app/screens/profile/domain/usecases/get_information_user.dart';
import 'package:coffee_kst/app/screens/profile/domain/usecases/update_avatar.dart';
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
import 'package:coffee_kst/app/screens/profile/screens/personal_information/screens/personal_information/bloc/update_avatar/update_avatar_bloc.dart';
import 'package:coffee_kst/core/network/network_info.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:coffee_kst/main_export.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - AuthenticationBloc
  // Bloc

  sl.registerFactory(
    () => NavigationScreenCubit(),
  );

  _diAuth();
  //---------------------------------------------------
  //Feature UserController
  _diUserController();
  //---------------------------------------------------------

  _diHome();
  //----------------------------------

  _diDetail();

  _diInvoice();
  // //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // //! External
  sl.registerLazySingleton(() => Connectivity());
}

_diAuth() {
  sl.registerFactory(
    () => AuthenticationBloc(
      authLoginUsecases: sl(),
    ),
  );
  sl.registerFactory(
    () => AuthPhoneBloc(),
  );
  // Use cases - Authentication
  sl.registerLazySingleton(() => AuthLoginUsecases(sl()));

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
}

_diUserController() {
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
  sl.registerFactory(
    () => UpdateAvatarBloc(
      updateAvatarUsecases: sl(),
    ),
  );
  //Use cases - UserController

  sl.registerLazySingleton(() => GetInformationUserUsecases(sl()));
  sl.registerLazySingleton(() => ChangePasswordUserUsecases(sl()));
  sl.registerLazySingleton(() => GetProvinceUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetDistrictUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetCommuneUsecase(repository: sl()));
  sl.registerLazySingleton(() => EditInformationUserUsecases(sl()));
  sl.registerLazySingleton(() => UpdateAvatarUsecases(sl()));
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
}

_diHome() {
  //Feature load product type
  sl.registerFactory(
    () => ProductTypeBloc(sl()),
  );
  sl.registerFactory(
    () => VoucherHomeBloc(sl()),
  );
  sl.registerFactory(
    () => ProductBloc(sl()),
  );
  // Use cases - PRoductControoller - voucher controller
  sl.registerLazySingleton(() => GetProducTypeUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetListProductUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetListVoucherUseCase(repository: sl()));
  // Repository - PRoductControoller
  sl.registerLazySingleton(
    () => HomeRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()),
  );
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );
  // Data sources - PRoductControoller
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
}

_diDetail() {
  //Feature load product type
  sl.registerFactory(
    () => ProductDetaiServicelBloc(sl(), sl(), sl()),
  );
  // Use cases - PRoductControoller - voucher controller
  sl.registerLazySingleton(() => GetDetailUseCase(repository: sl()));
  sl.registerLazySingleton(() => AddToCartEmptyUseCase(repository: sl()));
  sl.registerLazySingleton(() => AddToCartIsNotEmptyUseCase(repository: sl()));
  // Repository - PRoductControoller
  sl.registerLazySingleton(
    () => DetailRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()),
  );
  sl.registerLazySingleton<DetailRepository>(
    () => DetailRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );
  // Data sources - PRoductControoller
  sl.registerLazySingleton<DetailRemoteDataSource>(
    () => DetailRemoteDataSourceImpl(),
  );
}

_diInvoice() {
  sl.registerFactory(
    () => CartServiceBloc(sl(), sl()),
  );
  // Use cases - PRoductControoller - voucher controller
  sl.registerLazySingleton(() => GetCartUseCase(repository: sl()));
  sl.registerLazySingleton(() => RemoveItemUseCase(repository: sl()));
  // Repository - PRoductControoller
  sl.registerLazySingleton(
    () => InvoiceRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()),
  );
  sl.registerLazySingleton<InvoiceRepository>(
    () => InvoiceRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );
  // Data sources - PRoductControoller
  sl.registerLazySingleton<InvoiceRemoteDataSource>(
    () => InvoiceRemoteDataSourceImpl(),
  );
}
