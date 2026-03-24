import 'package:aladeep/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 0.82.sw,
      backgroundColor: const Color(0xFF0A1F2E),
      child: SafeArea(
        child: Column(
          children: [
            // Header with logo + close
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
                        color: Colors.white.withValues(alpha: 0.07),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.1),
                        ),
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
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

            Divider(color: Colors.white.withValues(alpha: 0.08)),
            SizedBox(height: 8.h),

            // Nav links
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  _DrawerItem(
                    icon: Icons.home_rounded,
                    title: 'الرئيسية',
                    onTap: () => Navigator.pop(context),
                  ),
                  _DrawerItem(
                    icon: Icons.menu_book_rounded,
                    title: 'الدورات التدريبية',
                    onTap: () => Navigator.pop(context),
                  ),
                  _DrawerItem(
                    icon: Icons.person_rounded,
                    title: 'عن المدرب',
                    onTap: () => Navigator.pop(context),
                  ),
                  _DrawerItem(
                    icon: Icons.star_rounded,
                    title: 'آراء الطلاب',
                    onTap: () => Navigator.pop(context),
                  ),
                  _DrawerItem(
                    icon: Icons.phone_rounded,
                    title: 'تواصل معنا',
                    onTap: () => Navigator.pop(context),
                  ),

                  SizedBox(height: 16.h),
                  Divider(color: Colors.white.withValues(alpha: 0.08)),
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
                        foregroundColor: Colors.white,
                        side: BorderSide(
                          color: Colors.white.withValues(alpha: 0.25),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),
                  Divider(color: Colors.white.withValues(alpha: 0.08)),
                  SizedBox(height: 16.h),

                  // Social icons row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _SocialIcon(icon: Icons.telegram),
                      SizedBox(width: 10.w),
                      _SocialIcon(icon: Icons.tiktok),
                      SizedBox(width: 10.w),
                      _SocialIcon(icon: Icons.facebook),
                      SizedBox(width: 10.w),
                      _SocialIcon(icon: Icons.youtube_searched_for_sharp),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  Text(
                    'جميع الحقوق محفوظة © 2026\nمنصة الأديب',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.3),
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

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      leading: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: AppColor.secondaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppColor.secondaryColor, size: 18.sp),
      ),
      title: Text(
        title,
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.85),
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(
        Icons.arrow_back_ios_rounded,
        color: Colors.white.withValues(alpha: 0.25),
        size: 14.sp,
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  const _SocialIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9.r),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Icon(
        icon,
        color: Colors.white.withValues(alpha: 0.7),
        size: 18.sp,
      ),
    );
  }
}
