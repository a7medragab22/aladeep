import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/themes/app_color.dart';
import 'package:aladeep/core/utils/drawer_item.dart';
import 'package:aladeep/core/utils/social_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 0.82.sw,
      backgroundColor: AppColor.white,
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Close button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor.withValues(
                          alpha: 0.05,
                        ), // خلفية خفيفة جداً
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColor.primaryColor.withValues(alpha: 0.1),
                        ),
                      ),
                      child: Icon(
                        Icons.close,
                        color: AppColor.primaryColor, // لون الغلق كحلي
                        size: 20.sp,
                      ),
                    ),
                  ),

                  // Logo
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColor.secondaryColor.withValues(alpha: 0.35),
                      ),
                    ),
                    child: Text(
                      'الأديب',
                      style: TextStyle(
                        color: AppColor.secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Divider(color: Colors.grey.shade200), // ديزاين أنظف للديوايدر
            SizedBox(height: 8.h),

            // Nav links
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  DrawerItem(
                    icon: Icons.home_rounded,
                    title: 'الرئيسية',
                    onTap: () {
                      // بيرجع للهوم ويشيل أي صفحات تانية كانت مفتوحة
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutsName.homeView,
                        (route) => false,
                      );
                    },
                  ),
                  DrawerItem(
                    icon: Icons.menu_book_rounded,
                    title: 'الدورات التدريبية',
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutsName.browsecourseView,
                    ),
                  ),
                  DrawerItem(
                    icon: Icons.person_rounded,
                    title: 'عن المدرب',
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutsName.aboutInstructorView,
                    ),
                  ),
                  DrawerItem(
                    icon: Icons.star_rounded, // أيقونة النجمة زي الصورة
                    title: 'آراء الطلاب',
                    onTap: () {
                      Navigator.pop(context);
                      // هنبعت argument مختلف عشان الهوم تعرف إننا عايزين سكشن التعليقات
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutsName.homeView,
                        (route) => false,
                        arguments: {'scrollToComments': true},
                      );
                    },
                  ),
                  DrawerItem(
                    icon: Icons.phone_rounded,
                    title: 'تواصل معنا',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutsName.homeView,
                        (route) => false,
                        arguments: {'scrollToFooter': true},
                      );
                    },
                  ),

                  SizedBox(height: 16.h),
                  Divider(color: Colors.grey.shade100),
                  SizedBox(height: 16.h),

                  // CTA Buttons
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.rocket_launch_rounded, size: 18.sp),
                      label: Text(
                        'ابدأ الآن',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.secondaryColor,
                        foregroundColor: AppColor.primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 12.h),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.lock_outline_rounded, size: 18.sp),
                      label: Text(
                        'دخول الطلاب',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor:
                            AppColor.primaryColor, // نص كحلي على خلفية بيضاء
                        side: BorderSide(
                          color: AppColor.primaryColor.withValues(alpha: 0.2),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),
                  Divider(color: Colors.grey.shade100),
                  SizedBox(height: 16.h),

                  // Social icons row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialIcon(icon: Icons.telegram),
                      SizedBox(width: 10.w),
                      SocialIcon(icon: Icons.tiktok),
                      SizedBox(width: 10.w),
                      SocialIcon(icon: Icons.facebook),
                      SizedBox(width: 10.w),
                      SocialIcon(icon: Icons.youtube_searched_for_sharp),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  Text(
                    'جميع الحقوق محفوظة © 2026\nمنصة الأديب',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade500, // رمادي هادي للحقوق
                      fontSize: 11.sp,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
