import 'package:aladeep/features/home/presentation/sections/brouse_courses_section.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aladeep/core/scroll_helper/scroll_helper.dart';
import 'package:aladeep/core/utils/app_drawer.dart';
import 'package:aladeep/core/utils/header.dart';
import 'package:aladeep/features/home/data/models/footer_link_model.dart';
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
    return Scaffold(
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController, // Controller من الـ Mixin
          slivers: [
            SliverToBoxAdapter(child: Header()),
            SliverToBoxAdapter(child: HeroSection()),
            SliverToBoxAdapter(child: StatsSection()),
            SliverToBoxAdapter(child: TestYourSelfSection()),
            SliverToBoxAdapter(child: VideoSection()),

            // مثال لإضافة Key لسكشن "لماذا نحن"
            SliverToBoxAdapter(child: WhySection(key: whyUsKey)),

            FeaturesListSection(),
            SliverToBoxAdapter(child: SuccefullStorysSection()),

            // سكشن الكومنتات مع الـ Key بتاعه
            CommentsSection(key: commentsKey),
            SliverToBoxAdapter(child: BrouseCoursesSection()),
            FooterSection(
              quickLinks: [
                FooterLink(
                  title: "الرئيسية",
                  onTap: () {
                    animateTo(0);
                  },
                ),
                FooterLink(
                  title: "عن المدرب",
                  onTap: () {
                    Navigator.pushNamed(context, '/aboutInstructorView');
                  },
                ),
                FooterLink(
                  title: "الدورات",
                  onTap: () {
                    Navigator.pushNamed(context, '/browsecourseView');
                  },
                ),
                FooterLink(
                  title: "آراء الطلاب",
                  onTap: () {
                    scrollToWidget(commentsKey);
                  },
                ),
                FooterLink(
                  title: "لماذا نحن",
                  onTap: () {
                    scrollToWidget(whyUsKey);
                  },
                ),
              ],
              socialLinks: <FaIconData, String>{
                FontAwesomeIcons.telegram: "https://t.me/+ilC41xR1A0xjZjU0",
                FontAwesomeIcons.tiktok:
                    "https://www.tiktok.com/@salahabdelaal100?_r=1&_t=ZS-950VqY9n0iX",
                FontAwesomeIcons.youtube:
                    "https://youtube.com/@salahabdel-aal6246?si=QNu4FQYF0Oqovw3c",
                FontAwesomeIcons.facebook:
                    "https://www.facebook.com/share/18UrxXvobe/?mibextid=wwXIfr",
                FontAwesomeIcons.instagram:
                    "https://www.instagram.com/aladib100?igsh=a2RuaXEwazF5bmpk",
              },
            ),
          ],
        ),
      ),
    );
  }
}
