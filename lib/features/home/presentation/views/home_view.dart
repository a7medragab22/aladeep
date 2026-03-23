import 'package:aladeep/core/utils/header.dart';
import 'package:aladeep/features/home/presentation/sections/comments_section.dart';
import 'package:aladeep/features/home/presentation/sections/features_list_section.dart';
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
          ],
        ),
      ),
    );
  }
}
