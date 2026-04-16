import 'dart:convert';
import 'package:aladeep/core/helpers/cache_helper.dart';
import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils/drawer_item.dart';
import 'package:aladeep/core/utils/social_icon.dart';
import 'package:aladeep/features/auth/models/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatefulWidget {
  final VoidCallback? onScrollToComments;
  final VoidCallback? onScrollToFooter;

  const AppDrawer({super.key, this.onScrollToComments, this.onScrollToFooter});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String userName = 'طالب';

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  void _loadUserInfo() {
    final userJson = CacheHelper.getData(key: 'user');
    if (userJson != null) {
      final user = CustomerModel.fromJson(jsonDecode(userJson));
      setState(() {
        userName = user.fullName ?? 'طالب';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = CacheHelper.getData(key: 'user') != null;
    return Drawer(
      width: 0.82.sw,
      backgroundColor: AppColors.white,
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
                        color: AppColors.primaryDark.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.primaryDark.withValues(alpha: 0.1),
                        ),
                      ),
                      child: Icon(
                        Icons.close,
                        color: AppColors.primaryDark,
                        size: 20.sp,
                      ),
                    ),
                  ),

                  // User Welcome
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryGold.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.primaryGold.withValues(alpha: 0.35),
                      ),
                    ),
                    child: Text(
                      'أهلاً، $userName',
                      style: TextStyle(
                        color: AppColors.primaryGold,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Divider(color: Colors.grey.shade200),
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
                    icon: Icons.star_rounded,
                    title: 'آراء الطلاب',
                    onTap: () {
                      Navigator.pop(context);
                      if (widget.onScrollToComments != null) {
                        widget.onScrollToComments!();
                      } else {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutsName.homeView,
                          (route) => false,
                          arguments: {'scrollToComments': true},
                        );
                      }
                    },
                  ),
                  DrawerItem(
                    icon: Icons.phone_rounded,
                    title: 'تواصل معنا',
                    onTap: () {
                      Navigator.pop(context);
                      if (widget.onScrollToFooter != null) {
                        widget.onScrollToFooter!();
                      } else {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutsName.homeView,
                          (route) => false,
                          arguments: {'scrollToFooter': true},
                        );
                      }
                    },
                  ),
                  if (isLoggedIn) ...[
                    DrawerItem(
                      icon: Icons.school_rounded,
                      title: 'منصتى التعليمية',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(
                          context,
                          AppRoutsName.myPlatformDashboard,
                        );
                      },
                    ),
                    DrawerItem(
                      icon: Icons.assessment_rounded,
                      title: 'نتائجي',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, AppRoutsName.myResults);
                      },
                    ),
                    DrawerItem(
                      icon: Icons.manage_accounts_rounded,
                      title: 'الملف الشخصي',
                      onTap: () {
                        Navigator.pop(context); // Close drawer first
                        Navigator.pushNamed(context, AppRoutsName.profileView);
                      },
                    ),
                  ],

                  SizedBox(height: 16.h),
                  Divider(color: Colors.grey.shade100),
                  SizedBox(height: 16.h),

                  // CTA Buttons
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
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
                        backgroundColor: AppColors.primaryGold,
                        foregroundColor: AppColors.primaryDark,
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
                    height: 50.h,
                    child: isLoggedIn
                        ? OutlinedButton.icon(
                            onPressed: () {
                              CacheHelper.clear();
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRoutsName.homeView,
                                (route) => false,
                              );
                            },
                            icon: Icon(Icons.logout_rounded, size: 18.sp),
                            label: Text(
                              'تسجيل الخروج',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.primaryDark,
                              side: BorderSide(
                                color: AppColors.primaryDark.withValues(
                                  alpha: 0.2,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          )
                        : OutlinedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutsName.loginView,
                              );
                            },
                            icon: Icon(Icons.login_rounded, size: 18.sp),
                            label: Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.primaryGreen,
                              side: BorderSide(
                                color: AppColors.primaryGreen.withValues(
                                  alpha: 0.2,
                                ),
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
                      SocialIcon(icon: FontAwesomeIcons.telegram),
                      SizedBox(width: 10.w),
                      SocialIcon(icon: FontAwesomeIcons.tiktok),
                      SizedBox(width: 10.w),
                      SocialIcon(icon: FontAwesomeIcons.facebook),
                      SizedBox(width: 10.w),
                      SocialIcon(icon: FontAwesomeIcons.youtube),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  Text(
                    'جميع الحقوق محفوظة © 2026\nمنصة الأديب',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade500,
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
