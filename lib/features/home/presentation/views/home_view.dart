import 'package:aladeep/core/themes/app_color.dart';
import 'package:aladeep/core/utils/header.dart';
import 'package:aladeep/features/home/presentation/widgets/features_list_section.dart';
import 'package:aladeep/features/home/presentation/widgets/hero_section.dart';
import 'package:aladeep/features/home/presentation/widgets/state_section.dart';
import 'package:aladeep/features/home/presentation/widgets/succefull_story_section.dart';
import 'package:aladeep/features/home/presentation/widgets/test_your_self_section.dart';
import 'package:aladeep/features/home/presentation/widgets/video_section.dart';
import 'package:aladeep/features/home/presentation/widgets/why_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          ],
        ),
      ),
    );
  }
}
