part of '../service_locator.dart';

class MyPlatformServiceLocator {
  static Future<void> execute({required GetIt getIt}) async {
    // Data Source
    getIt.registerLazySingleton<MyPlatformDataSource>(
      () => MyPlatformDataSourceImpl(getIt<GenericDataSource>()),
    );

    // Bloc
    getIt.registerFactory<MyPlatformBloc>(
      () => MyPlatformBloc(getIt<MyPlatformDataSource>()),
    );
  }
}
