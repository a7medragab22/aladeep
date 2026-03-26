import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/scroll_helper/scroll_helper.dart';
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
      backgroundColor: AppColor.bgColor,
      // إضافة الـ Drawer عشان يكون ثابت في كل التطبيق
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            controller: scrollController,
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
                quickLinks: [
                  FooterLink(
                    title: "الرئيسية",
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutsName.homeView);
                    },
                  ),
                  FooterLink(
                    title: "عن المدرب",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutsName.aboutInstructorView,
                      );
                    },
                  ),
                  FooterLink(
                    title: "الدورات",
                    onTap: () {
                      animateTo(0);
                    },
                  ),
                  FooterLink(
                    title: "آراء الطلاب",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutsName.homeView,
                        arguments: {'scrollToComments': true},
                      );
                    },
                  ),
                  FooterLink(
                    title: "لماذا نحن",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutsName.homeView,
                        arguments: {'scrollToWhyUs': true},
                      );
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
      ),
    );
  }
}
