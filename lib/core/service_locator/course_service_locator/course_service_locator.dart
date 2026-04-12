part of '../service_locator.dart';

class CourseServiceLocator {
  static Future<void> execute({required GetIt getIt}) async {
    // Data Sources
    getIt.registerLazySingleton<CourseDataSource>(
      () => CourseDataSourceImpl(getIt<GenericDataSource>()),
    );

    // Blocs
    getIt.registerFactory<CourseDetailsBloc>(
      () => CourseDetailsBloc(getIt<CourseDataSource>()),
    );
  }
}
