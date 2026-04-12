part of '../service_locator.dart';

class AuthServiceLocator {
  static Future<void> execute({required GetIt getIt}) async {
    //data sources
    getIt.registerLazySingleton<RegisterDataSource>(
      () => RegisterDataSourceImpl(getIt<GenericDataSource>()),
    );
    getIt.registerLazySingleton<LoginDataSource>(
      () => LoginDataSourceImpl(getIt<GenericDataSource>()),
    );

    getIt.registerLazySingleton<ProfileUpdateDataSource>(
      () => ProfileUpdateDataSourceImpl(getIt<GenericDataSource>()),
    );
    //blocs
    getIt.registerFactory<RegisterBloc>(
      () => RegisterBloc(getIt<RegisterDataSource>()),
    );
    getIt.registerFactory<LoginBloc>(() => LoginBloc(getIt<LoginDataSource>()));
    // getIt.registerFactory<LogoutBloc>(
    //   () => LogoutBloc(getIt<LogoutDataSource>()),
    // );

    getIt.registerFactory<ProfileUpdateBloc>(
      () => ProfileUpdateBloc(getIt<ProfileUpdateDataSource>()),
    );
  }
}
