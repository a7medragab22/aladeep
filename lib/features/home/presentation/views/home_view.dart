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

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Header()),
            SliverToBoxAdapter(child: HeroSection()),
            SliverToBoxAdapter(child: StatsSection()),
            SliverToBoxAdapter(child: TestYourSelfSection()),
            SliverToBoxAdapter(child: VideoSection()),
            SliverToBoxAdapter(child: WhySection()),
            FeaturesListSection(),
            SliverToBoxAdapter(child: SuccefullStorysSection()),
            CommentsSection(),
            FooterSection(
              quickLinks: const [
                FooterLink(title: "الرئيسية", url: "https://example.com/home"),
                FooterLink(
                  title: "عن المدرب",
                  url: "https://example.com/about",
                ),
                FooterLink(
                  title: "الدورات",
                  url: "https://example.com/courses",
                ),
                FooterLink(
                  title: "آراء الطلاب",
                  url: "https://example.com/reviews",
                ),
                FooterLink(
                  title: "سياسة الخصوصية",
                  url: "https://example.com/privacy",
                ),
              ],
              socialLinks: {
                Icons.telegram: "https://t.me/your_channel",
                Icons.tiktok: "https://tiktok.com",
                Icons.youtube_searched_for_sharp: "https://youtube.com",
                Icons.install_desktop: "https://instagram.com",
                Icons.facebook: "https://facebook.com",
              },
            ),
          ],
        ),
      ),
    );
  }
}
