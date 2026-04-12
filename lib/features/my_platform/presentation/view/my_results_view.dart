import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils/app_drawer.dart';
import 'package:aladeep/core/utils/header.dart';
import 'package:aladeep/features/home/data/models/footer_link_model.dart';
import 'package:aladeep/features/home/presentation/sections/footer_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyResultsView extends StatelessWidget {
  const MyResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.all(24.w),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        // Banner
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(24.r),
                          decoration: BoxDecoration(
                            color: AppColors.primaryDark,
                            borderRadius: BorderRadius.circular(16),
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/pattern.png',
                              ), // Placeholder or subtle pattern
                              opacity: 0.1,
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'سجل التميز والدرجات',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      'تابع تطور مستواك بدقة في اختبارات القدرات اللفظي بنجاح.',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Container(
                                padding: EdgeInsets.all(12.r),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryGold,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.emoji_events_rounded,
                                  color: AppColors.primaryDark,
                                  size: 30.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h),

                        // Result Cards (Mock Data)
                        _buildResultCard(
                          '12/04/2026',
                          '1 / 0',
                          '0%',
                          Icons.sentiment_dissatisfied,
                          Colors.red,
                          'يع',
                        ),
                        _buildResultCard(
                          '12/04/2026',
                          '1 / 0',
                          '0%',
                          Icons.sentiment_dissatisfied,
                          Colors.red,
                          'يع',
                        ),
                        SizedBox(height: 24.h),
                      ]),
                    ),
                  ),
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
                          Navigator.pushNamed(context, AppRoutsName.homeView);
                        },
                      ),
                      FooterLink(
                        title: "لماذا نحن",
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutsName.homeView);
                        },
                      ),
                      FooterLink(
                        title: "سياسة الخصوصية",
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutsName.privacyPolicyView,
                          );
                        },
                      ),
                    ],
                    socialLinks: <FaIconData, String>{
                      FontAwesomeIcons.telegram:
                          "https://t.me/+ilC41xR1A0xjZjU0",
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
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard(
    String date,
    String score,
    String percentage,
    IconData icon,
    Color iconColor,
    String testName,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row in Card
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: iconColor, size: 28.sp),
              Text(
                testName,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(color: Colors.grey.shade100, thickness: 1.5),
          SizedBox(height: 16.h),

          // Details
          _buildInfoRow('التاريخ:', date, isLtr: true),
          SizedBox(height: 12.h),
          _buildInfoRow('الإجابات الصحيحة:', score, isLtr: true),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  percentage,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Text(
                'النسبة المئوية:',
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, {bool isLtr = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
          style: TextStyle(
            color: AppColors.primaryDark,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
        Text(
          textDirection: TextDirection.rtl,
          title,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 13.sp),
        ),
      ],
    );
  }
}
