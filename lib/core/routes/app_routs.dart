import 'package:aladeep/core/helpers/helpers.dart';
import 'package:aladeep/core/service_locator/service_locator.dart';
import 'package:aladeep/features/about_instuctor_screen/presentation/view/about_instructor.dart';
import 'package:aladeep/features/auth/auth.dart';
import 'package:aladeep/features/auth/login/presentation/login_result_view.dart';
import 'package:aladeep/features/auth/models/customer_model.dart';
import 'package:aladeep/features/auth/profile/presentation/profile_view.dart';
import 'package:aladeep/features/auth/register/presentation/view/register_result_view.dart';
import 'package:aladeep/features/auth/register/presentation/view/register_view.dart';
import 'package:aladeep/features/home/presentation/bloc/home_bloc.dart';
import 'package:aladeep/features/privacy_policy/presentation/views/privacy_policy_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/routes/app_routs_name.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/auth/login/presentation/login.dart';
import '../../features/browse_course_screen/presentation/view/browse_course_screen.dart';
import '../../features/subscriptions/presentation/view/subscriptions_view.dart';
import '../../features/course/presentation/views/course_details_view.dart';
import '../../features/subscriptions/presentation/view/confirm_subscription_view.dart';

class AppRouts {
  static Map<String, WidgetBuilder> routes = {
    AppRoutsName.homeView: (_) => const HomeView(),
    AppRoutsName.browsecourseView: (_) => BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(const FetchHomeData()),
      child: const BrowseCoursesScreen(),
    ),
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
    AppRoutsName.courseDetailsView: (context) {
      final args = ModalRoute.of(context)?.settings.arguments;
      final courseId = args is int ? args : 0;
      return CourseDetailsView(courseId: courseId);
    },
    AppRoutsName.confirmSubscription: (context) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is Map<String, dynamic>) {
        return ConfirmSubscriptionView(
          courseId: args['courseId'],
          price: (args['price'] as num?)?.toDouble() ?? 0.0,
          isBundle: args['isBundle'] ?? false,
        );
      }
      return const Scaffold(body: Center(child: Text('Invalid Arguments')));
    },
  };
}
