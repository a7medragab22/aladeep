part of '../service_locator.dart';

class TestYourSelfServiceLocator {
  static Future<void> execute({required GetIt getIt}) async {
    // Data Source
    getIt.registerLazySingleton<TestYourSelfDataSource>(
      () => TestYourSelfDataSourceImpl(getIt<GenericDataSource>()),
    );

    // Bloc
    getIt.registerFactory<QuizBloc>(
      () => QuizBloc(getIt<TestYourSelfDataSource>()),
    );
  }
}
