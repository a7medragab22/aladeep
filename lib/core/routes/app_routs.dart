import 'package:aladeep/features/about_instuctor_screen/presentation/view/about_instructor.dart';
import 'package:flutter/material.dart';
import '../../core/routes/app_routs_name.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/authentication/login/view/presntation/login.dart';
import '../../features/browse_course_screen/presentation/view/browse_course_screen.dart';

class AppRouts {
  static Map<String, WidgetBuilder> routes = {
    AppRoutsName.homeView: (_) => const HomeView(),
    AppRoutsName.browsecourseView: (_) => const BrowseCoursesScreen(),
    AppRoutsName.loginView: (_) => const LoginView(),
    AppRoutsName.aboutInstructorView: (_) => const AboutInstructorScreen(),
  };
}
