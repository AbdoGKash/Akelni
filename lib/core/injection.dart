import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/networking/api_service.dart';
import 'package:flutter_application_1/core/networking/api_service_home.dart';
import 'package:flutter_application_1/features/home/data/repo/home_repo.dart';
import 'package:flutter_application_1/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_application_1/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_application_1/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:flutter_application_1/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

import '../features/chang_language_and_theme/chang_lang_cubit.dart';
import '../features/internet_connection/internet_connection_cubit.dart';
import '../features/login/data/repo/login_repo.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  getIt
      .registerLazySingleton<ApiService>(() => ApiService(createAndSetupDio()));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(
      () => LoginCubit(getIt())); // registerLazySingleton => error
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  getIt.registerLazySingleton<ApiServiceHome>(
      () => ApiServiceHome(createAndSetupDio()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerLazySingleton<ChangeLanguageAndThemeCubit>(
      () => ChangeLanguageAndThemeCubit());
  getIt.registerFactory<InternetConnectionCubit>(
      () => InternetConnectionCubit());
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = const Duration(seconds: 10)
    ..options.receiveTimeout = const Duration(seconds: 20);

  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    error: true,
    requestHeader: true,
    responseHeader: true,
    request: true,
    responseBody: true,
  ));
  return dio;
}
