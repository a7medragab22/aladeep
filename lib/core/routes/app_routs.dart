import 'package:aladeep/core/helpers/helpers.dart';
import 'package:aladeep/core/service_locator/service_locator.dart';
import 'package:aladeep/features/about_instuctor_screen/presentation/view/about_instructor.dart';
import 'package:aladeep/features/auth/auth.dart';
import 'package:aladeep/features/auth/login/presentation/login_result_view.dart';
import 'package:aladeep/features/auth/models/customer_model.dart';
import 'package:aladeep/features/auth/profile/presentation/profile_view.dart';
import 'package:aladeep/features/auth/register/presentation/view/register_result_view.dart';
import 'package:aladeep/features/auth/register/presentation/view/register_view.dart';
import 'package:aladeep/features/privacy_policy/presentation/views/privacy_policy_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/routes/app_routs_name.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/auth/login/presentation/login.dart';
import '../../features/browse_course_screen/presentation/view/browse_course_screen.dart';
import '../../features/subscriptions/presentation/view/subscriptions_view.dart';

class AppRouts {
  static Map<String, WidgetBuilder> routes = {
    AppRoutsName.homeView: (_) => const HomeView(),
    AppRoutsName.browsecourseView: (_) => const BrowseCoursesScreen(),
    AppRoutsName.loginView: (_) => BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: const LoginView(),
    ),
    AppRoutsName.aboutInstructorView: (_) => const AboutInstructorScreen(),
    AppRoutsName.registerView: (_) => BlocProvider(
      create: (context) => getIt<RegisterBloc>(),
      child: RegisterView(),
    ),
    AppRoutsName.loginResultView: (context) {
      final args = ModalRoute.of(context)?.settings.arguments;
      final name = args is String ? args : 'طالب';
      return LoginResultView(name: name);
    },
    AppRoutsName.registerResultView: (context) {
      final args = ModalRoute.of(context)?.settings.arguments;
      final name = args is String ? args : '';
      return RegisterResultView(name: name);
    },
    AppRoutsName.privacyPolicyView: (_) => const PrivacyPolicyPage(),
    AppRoutsName.subscriptionsView: (_) => const SubscriptionsView(),
    AppRoutsName.profileView: (context) {
      return BlocProvider(
        create: (_) => getIt<ProfileUpdateBloc>(),
        child: const ProfileView(),
      );
    },
  };
}
