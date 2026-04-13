import 'package:aladeep/core/helpers/cache_helper.dart';
import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:aladeep/features/home/data/models/home_model.dart';

class HeroSection extends StatelessWidget {
  final SettingsModel? settings;
  const HeroSection({super.key, this.settings});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 60.h,
        bottom: 60.h,
        left: 24.w,
        right: 24.w,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0A1F2E), Color(0xFF0E2A3B), Color(0xFF0B1F2B)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.primaryGold.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: AppColors.primaryGold.withValues(alpha: 0.4),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.auto_awesome,
                  color: AppColors.primaryGold,
                  size: 14.sp,
                ),
                SizedBox(width: 6.w),
                Text(
                  'منصة تعليمية متخصصة #1',
                  style: TextStyle(
                    color: AppColors.primaryGold,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 24.h),

          Text(
            'منصة الأديب\nللقدرات اللفظي',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.sp,
              height: 1.4,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 16.h),

          Text(
            'الوجهة الأولى لتأسيس وتدريب قدراتك، مع أقوى محاكي اختبارات ذكي يضمن لك الوصول للعلامة الكاملة 100% بإذن الله.',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.75),
              fontSize: 14.sp,
              height: 1.8,
            ),
          ),

          SizedBox(height: 40.h),

          if (CacheHelper.getData(key: 'token') == null)
            CustomButton(
              text: 'ابدأ التعلم الآن',
              textColor: AppColors.primaryDarker,
              icon: Icons.rocket_launch_sharp,
              backgroundColor: AppColors.primaryGold,
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutsName.browsecourseView),
            ),
          SizedBox(height: 16.h),
          if (CacheHelper.getData(key: 'token') == null)
            CustomButton(
              text: 'تسجيل الدخول',
              backgroundColor: AppColors.primaryDark,
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutsName.loginView),
            ),
        ],
      ),
    );
  }
}
