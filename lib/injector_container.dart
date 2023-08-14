import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:test_chat_app/core/app_bloc/app_bloc.dart';
import 'package:test_chat_app/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:test_chat_app/routes/app_router.dart';

final sl = GetIt.instance;

Future<void> init() async {
  _initAppRouter();

  sl
    ..registerLazySingleton(
      () => Dio()
        ..options = BaseOptions(
          contentType: 'application/json',
          sendTimeout: const Duration(seconds: 120),
          receiveTimeout: const Duration(seconds: 30),
          connectTimeout: const Duration(seconds: 30),
        )
        ..interceptors.addAll(
          [
            LogInterceptor(
              error: false,
              responseBody: true,
              logPrint: (object) {
                debugPrint(object.toString());
              },
            ),
            // chuck.getDioInterceptor(),
          ],
        ),
    )
    ..registerSingleton<AppBloc>(AppBloc())

    // /// Core
    // ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()))
    ..registerLazySingleton(() => InternetConnectionCheckerPlus());

  /// Features
  _chatFeature();
}

void _initAppRouter() {
  sl.registerSingleton<AppRouter>(AppRouter());
}

void _chatFeature() {
  /// Presentation
  sl.registerFactory(
    () => ChatBloc(),
  );
}
