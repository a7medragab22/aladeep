import 'package:aladeep/features/about_instuctor_screen/presentation/view/about_instructor.dart';
import 'package:aladeep/features/authentication/register/data/register_repo/register_repo_impl.dart';
import 'package:aladeep/features/authentication/register/logic/register_cubit/register_cubit.dart';
import 'package:aladeep/features/authentication/register/presentation/view/register_result_view.dart';
import 'package:aladeep/features/authentication/register/presentation/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    AppRoutsName.registerView: (_) => BlocProvider(
      create: (_) => RegisterCubit(RegisterRepoImpl()),
      child: RegisterView(),
    ),
    AppRoutsName.registerResultView: (context) {
      final name = ModalRoute.of(context)!.settings.arguments as String;
      return RegisterResultView(name: name);
    },
  };
}
