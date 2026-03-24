import 'dart:developer';

import 'package:aladeep/core/themes/app_color.dart';
import 'package:aladeep/core/utils/custom_button.dart';
import 'package:aladeep/features/authentication/login/view/presntation/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

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
              color: AppColor.primaryGold.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: AppColor.primaryGold.withValues(alpha: 0.4),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.auto_awesome,
                  color: AppColor.primaryGold,
                  size: 14.sp,
                ),
                SizedBox(width: 6.w),
                Text(
                  'منصة تعليمية متخصصة #1',
                  style: TextStyle(
                    color: AppColor.primaryGold,
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

          CustomButton(
            icon: Icons.rocket_launch,
            text: 'ابدأ التعلم الآن',
            backgroundColor: AppColor.primaryGold,
            textColor: AppColor.primaryDark,
          ),
          SizedBox(height: 14.h),

          TextButton(
            onPressed: () {
              log("Navigator to login");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginView()),
              );
            },
            child: Text(
              'تسجيل الدخول',
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            ),
          ),

          SizedBox(height: 48.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TrustBadge(icon: Icons.verified_user, text: 'آمن 100%'),
              SizedBox(width: 20.w),
              _TrustBadge(icon: Icons.support_agent, text: 'دعم 24/7'),
              SizedBox(width: 20.w),
              _TrustBadge(icon: Icons.groups, text: '+10,000 طالب'),
            ],
          ),
        ],
      ),
    );
  }
}

class _TrustBadge extends StatelessWidget {
  final IconData icon;
  final String text;
  const _TrustBadge({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColor.primaryGold, size: 20.sp),
        SizedBox(height: 4.h),
        Text(
          text,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }
}
