import 'package:aladeep/core/themes/app_color.dart';
import 'package:aladeep/core/utils/app_drawer.dart'; // الـ Drawer الموحد
import 'package:aladeep/core/utils/header.dart'; // الهيدر الموحد
import 'package:aladeep/features/browse_course_screen/data/course_model/dummy_data.dart';
import 'package:aladeep/features/browse_course_screen/presentation/widget/build_feature_package.dart';
import 'package:aladeep/features/browse_course_screen/presentation/widget/course_card.dart';
import 'package:aladeep/features/home/data/models/footer_link_model.dart';
import 'package:aladeep/features/home/presentation/sections/footer_section.dart'; // الفوتر الموحد
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrowseCoursesScreen extends StatelessWidget {
  const BrowseCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      // إضافة الـ Drawer عشان يكون ثابت في كل التطبيق
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              // ── Header الموحد ──
              const SliverToBoxAdapter(child: Header()),

              // ── Featured Package ──
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 8.h,
                  ),
                  child: const BuildFeaturePackage(),
                ),
              ),

              // ── Section Title ──
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 12.h),
                  child: Row(
                    children: [
                      Container(
                        width: 4.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: AppColor.primaryGreen,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'الدورات التدريبية',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryDarker,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Courses List ──
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: CourseCard(course: dummyCourses[index]),
                    ),
                    childCount: dummyCourses.length,
                  ),
                ),
              ),

              // ── Footer الموحد ──
              FooterSection(
                quickLinks: const [
                  FooterLink(
                    title: "الرئيسية",
                    url: "https://example.com/home",
                  ),
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
      ),
    );
  }
}
