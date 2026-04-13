import 'package:aladeep/core/bloc/paginated_bloc/exports.dart';
import 'package:aladeep/features/home/presentation/sections/brouse_courses_section.dart';
import 'package:aladeep/core/scroll_helper/scroll_helper.dart';
import 'package:aladeep/core/utils/app_drawer.dart';
import 'package:aladeep/core/utils/header.dart';
import 'package:aladeep/features/home/presentation/sections/comments_section.dart';
import 'package:aladeep/features/home/presentation/sections/features_list_section.dart';
import 'package:aladeep/features/home/presentation/sections/footer_section.dart';
import 'package:aladeep/features/home/presentation/sections/hero_section.dart';
import 'package:aladeep/features/home/presentation/sections/state_section.dart';
import 'package:aladeep/features/home/presentation/sections/succefull_story_section.dart';
import 'package:aladeep/features/home/presentation/sections/test_your_self_section.dart';
import 'package:aladeep/features/home/presentation/sections/video_section.dart';
import 'package:aladeep/features/home/presentation/sections/why_section.dart';
import 'package:flutter/material.dart';

import 'package:aladeep/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/enum/status.dart';
import '../../../../core/service_locator/service_locator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeScrollMixin {
  @override
  void initState() {
    super.initState();
    // تشغيل فحص الـ Scroll Arguments
    handleScroll(context);
  }

  @override
  void dispose() {
    disposeScroll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(const FetchHomeData()),
      child: Scaffold(
        endDrawer: const AppDrawer(),
        body: SafeArea(
          child: BlocBuilder<HomeBloc, BaseState>(
            builder: (context, state) {
              if (state.status == Status.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              final homeData = state.data;
              return Column(
                children: [
                  Header(),
                  Expanded(
                    child: HomeScrollProvider(
                      scrollController: scrollController,
                      commentsKey: commentsKey,
                      whyUsKey: whyUsKey,
                      child: CustomScrollView(
                        controller: scrollController, // Controller من الـ Mixin
                        slivers: [
                          SliverToBoxAdapter(
                            child: HeroSection(settings: homeData?.settings),
                          ),
                          SliverToBoxAdapter(child: StatsSection()),
                          SliverToBoxAdapter(
                            child: TestYourSelfSection(
                              settings: homeData?.settings,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: VideoSection(settings: homeData?.settings),
                          ),
                          SliverToBoxAdapter(child: WhySection(key: whyUsKey)),
                          FeaturesListSection(),
                          SliverToBoxAdapter(child: SuccefullStorysSection()),
                          CommentsSection(key: commentsKey),
                          SliverToBoxAdapter(
                            child: BrouseCoursesSection(
                              courses: homeData?.courses ?? [],
                            ),
                          ),
                          const FooterSection(),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
