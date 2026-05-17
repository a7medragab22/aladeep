part of '../service_locator.dart';

final GetIt getIt = GetIt.instance;

abstract interface class DI {
  static Future<void> execute() async {
    await AuthServiceLocator.execute(getIt: getIt);
    await HomeServiceLocator.execute(getIt: getIt);
    await CourseServiceLocator.execute(getIt: getIt);
    await MyPlatformServiceLocator.execute(getIt: getIt);
    await TestYourSelfServiceLocator.execute(getIt: getIt);
    setupSubscriptionServiceLocator(getIt);
    await SharedServiceLocator.execute(getIt: getIt);
  }
}
