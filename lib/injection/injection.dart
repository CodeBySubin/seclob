import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

// Core
import 'package:seclob/core/network/api_client.dart';

// Auth
import 'package:seclob/features/authentication/data/repository/auth_repository.dart';
import 'package:seclob/features/authentication/domain/repository/auth_repository.dart';
import 'package:seclob/features/authentication/domain/usecases/login_usecase.dart';
import 'package:seclob/features/authentication/presentation/viewmodel/login_viewmodel.dart';

// Home
import 'package:seclob/features/home/data/repository_impl.dart';
import 'package:seclob/features/home/domain/repository.dart';
import 'package:seclob/features/home/domain/usecases.dart';
import 'package:seclob/features/home/presentation/viewmodel/home_view_model.dart';

//profile
import 'package:seclob/features/profile/data/repositry_impl.dart';
import 'package:seclob/features/profile/domain/repository.dart';
import 'package:seclob/features/profile/domain/usecases.dart';
import 'package:seclob/features/profile/presentation/viewmodel/profile_viewmodel.dart';


final getIt = GetIt.instance;

void setupLocator() {
  // External
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt()));

  // Auth
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt()));
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));
  getIt.registerFactory<LoginViewModel>(() => LoginViewModel(getIt()));

  // Home
  getIt.registerLazySingleton<BalanceRepository>(() => BalanceRepositoryImpl(getIt()));
  getIt.registerLazySingleton<GetBalancesUseCase>(() => GetBalancesUseCase(getIt()));
  getIt.registerFactory<HomeViewModel>(() => HomeViewModel(getIt()));

  // Profile
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(getIt()));
  getIt.registerLazySingleton<GetUserProfile>(() => GetUserProfile(getIt()));
  getIt.registerFactory<ProfileViewModel>(() => ProfileViewModel(getIt()));
}
