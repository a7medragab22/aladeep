import 'package:aladeep/core/helpers/helpers.dart';
import 'package:aladeep/features/test_your_self/data/datasource/test_your_self_data_source.dart';
import 'package:aladeep/features/test_your_self/presentation/bloc/quiz_bloc.dart';
import 'package:get_it/get_it.dart';

abstract interface class TestYourSelfServiceLocator {
  static Future<void> execute({required GetIt getIt}) async {
    // Data Source
    getIt.registerLazySingleton<TestYourSelfDataSource>(
      () => TestYourSelfDataSourceImpl(GenericDataSource(getIt())),
    );

    // Bloc
    getIt.registerFactory(() => QuizBloc(getIt()));
  }
}
