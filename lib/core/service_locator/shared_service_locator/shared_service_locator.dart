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
    getIt.registerLazySingleton<Dio>(() {
      final dio = Dio(
        BaseOptions(
          baseUrl: Endpoints.baseUrl,
          connectTimeout: const Duration(seconds: 60),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Cache-Control': 'no-cache',
            'Pragma': 'no-cache',
          },
        ),
      );

      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            // Dynamically get fresh token and language for every request
            final token = CacheHelper.getData(key: 'token') ?? '';
            final isArabic = navigatorKey.currentContext?.isArabic ?? true;

            options.headers['Authorization'] = 'Bearer $token';
            options.headers['Accept-Language'] = isArabic ? 'ar' : 'en';

            return handler.next(options);
          },
        ),
      );

      if (kDebugMode) {
        dio.interceptors.add(
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
        );
      }
      return dio;
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
