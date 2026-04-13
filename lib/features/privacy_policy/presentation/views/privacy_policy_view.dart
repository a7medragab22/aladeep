import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/utils/app_drawer.dart';
import 'package:aladeep/core/utils/header.dart';
import 'package:aladeep/features/browse_course_screen/presentation/widget/header_section.dart';
import 'package:aladeep/features/privacy_policy/presentation/widgets/custom_row.dart';
import 'package:aladeep/features/privacy_policy/presentation/widgets/first_section.dart';
import 'package:aladeep/features/privacy_policy/presentation/widgets/intellectual_content.dart';
import 'package:aladeep/features/privacy_policy/presentation/widgets/payment_content.dart';
import 'package:aladeep/features/privacy_policy/presentation/widgets/second_section.dart';
import 'package:aladeep/features/privacy_policy/presentation/widgets/third_section.dart';
import 'package:aladeep/features/home/data/models/footer_link_model.dart';
import 'package:aladeep/features/home/presentation/sections/footer_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: Header()),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 36.h),
                    const HeaderSection(),
                    const SizedBox(height: 24),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 60.h,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const FirstSection(),
                          Divider(color: Colors.grey.shade300),
                          const SecondSection(),
                          Divider(color: Colors.grey.shade300),
                          const ThirdSection(),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
