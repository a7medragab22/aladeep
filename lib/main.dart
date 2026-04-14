import 'package:aladeep/core/routes/app_routs.dart';
import 'package:aladeep/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:aladeep/core/helpers/cache_helper.dart';
import 'package:aladeep/core/service_locator/service_locator.dart';

// 0540091992
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DI.execute();
  runApp(const AlAdeepApp());
}

class AlAdeepApp extends StatelessWidget {
  const AlAdeepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) => MaterialApp(
        routes: AppRouts.routes,
        theme: AppThemeData.light(context),
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: scaffoldMessengerKey,
        navigatorKey: navigatorKey,
      ),
    );
  }
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
