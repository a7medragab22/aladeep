part of '../service_locator.dart';

void setupSubscriptionServiceLocator(GetIt getIt) {
  // Data Source
  getIt.registerLazySingleton<SubscriptionDataSource>(
    () => SubscriptionDataSourceImpl(getIt()),
  );

  // Bloc
  getIt.registerFactory<SubscribeBloc>(
    () => SubscribeBloc(getIt()),
  );
}
