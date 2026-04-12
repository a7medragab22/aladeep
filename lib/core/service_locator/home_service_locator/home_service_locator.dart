part of '../service_locator.dart';

class HomeServiceLocator {
  static Future<void> execute({required GetIt getIt}) async {
    // Data Sources
    getIt.registerLazySingleton<HomeDataSource>(
      () => HomeDataSourceImpl(getIt<GenericDataSource>()),
    );

    // Blocs
    getIt.registerFactory<HomeBloc>(
      () => HomeBloc(getIt<HomeDataSource>()),
    );
  }
}
