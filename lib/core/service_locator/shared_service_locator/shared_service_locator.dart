import 'package:aladeep/core/extensions/extensions.dart';
import 'package:aladeep/core/helpers/cache_helper.dart';
import 'package:aladeep/core/helpers/helpers.dart';
import 'package:aladeep/core/http/http.dart';

import 'package:aladeep/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class SharedServiceLocator {
  static Future<void> execute({required GetIt getIt}) async {
    final token = CacheHelper.getData(key: 'token') ?? '';

    loggerWarn("token in sl $token");
    loggerWarn(
      "Accept Language in sl ${navigatorKey.currentContext?.isArabic}",
    );
    getIt.registerLazySingleton<Dio>(() {
      return Dio(
          BaseOptions(
            baseUrl: Endpoints.baseUrl,
            connectTimeout: const Duration(seconds: 60),
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'Cache-Control': 'no-cache',
              'Pragma': 'no-cache',
              'Accept-Language': navigatorKey.currentContext?.isArabic ?? true
                  ? 'ar'
                  : 'en',
              'Authorization': 'Bearer $token',
            },
          ),
        )
        ..interceptors.addAll([
          if (kDebugMode)
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseBody: true,
              responseHeader: false,
              error: true,
              compact: true,
              enabled: true,
              request: true,
              maxWidth: 90,
            ),
        ]);
    });
    getIt.registerLazySingleton<ApiConsumer>(
      () => BaseApiConsumer(dio: getIt<Dio>()),
    );
    getIt.registerLazySingleton<GenericDataSource>(
      () => GenericDataSource(getIt<ApiConsumer>()),
    );
    getIt.registerLazySingleton<SyncManager>(() => SyncManager());
    getIt.registerLazySingleton<ConnectivityService>(
      () => ConnectivityService.instance,
    );

    // getIt.registerLazySingleton<SyncBloc>(() => SyncBloc(syncManager: getIt<SyncManager>(), connectivityService: getIt<ConnectivityService>()));
  }
}

class SyncManager {} // Placeholder if missing, or import if exists

class ConnectivityService {
  static ConnectivityService get instance => ConnectivityService();
} // Placeholder if missing
