import 'package:aladeep/core/bloc/paginated_bloc/exports.dart';
import 'package:aladeep/features/browse_course_screen/presentation/widget/header_section.dart';
import 'package:aladeep/features/browse_course_screen/presentation/widget/premium_card.dart';
import 'package:aladeep/core/scroll_helper/scroll_helper.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils/app_drawer.dart'; // الـ Drawer الموحد
import 'package:aladeep/core/utils/header.dart'; // الهيدر الموحد
import 'package:aladeep/features/browse_course_screen/presentation/widget/custom_course_card.dart';
import 'package:aladeep/features/home/presentation/sections/footer_section.dart'; // الفوتر الموحد
import 'package:flutter/material.dart';
import 'package:aladeep/features/home/presentation/bloc/home_bloc.dart';
import 'package:aladeep/features/home/data/models/home_model.dart';
import 'package:aladeep/core/enum/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrowseCoursesScreen extends StatefulWidget {
  const BrowseCoursesScreen({super.key});

  @override
  State<BrowseCoursesScreen> createState() => _BrowseCoursesScreenState();
}

class _BrowseCoursesScreenState extends State<BrowseCoursesScreen>
    with HomeScrollMixin {
  @override
  void initState() {
    super.initState();
    handleScroll(context);
  }

  @override
  void dispose() {
    disposeScroll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, BaseState>(
          builder: (context, state) {
            if (state.status == Status.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            final List<CourseSummaryModel> apiCourses =
                (state.data as HomeModel?)?.courses ?? [];

            return Column(
              children: [
                Header(),
                Expanded(
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(child: HeaderSection()),
                      SliverToBoxAdapter(
                        child: PremiumCard(
                          settings: (state.data as HomeModel?)?.settings,
                        ),
                      ),
                      const SliverToBoxAdapter(child: SizedBox(height: 20)),
                      SliverPadding(
                        padding: const EdgeInsets.only(bottom: 20),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: CustomCourseCard(
                                courseSummary: apiCourses[index],
                              ),
                            ),
                            childCount: apiCourses.length,
                          ),
                        ),
                      ),

                      // ── Footer الموحد ──
                      const FooterSection(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
