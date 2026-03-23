import 'package:aladeep/core/themes/app_color.dart';
import 'package:aladeep/core/utils/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0E2A3B), Color(0xFF0B1F2B)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'منصة الأديب للقدرات اللفظي',
            textDirection: TextDirection.rtl,

            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              height: 1.4,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'الوجهة الأولى لتأسيس وتدريب قدراتك، مع أقوى محاكي اختبارات ذكي يضمن لك الوصول للعلامة الكاملة 100% بإذن الله.',
            textDirection: TextDirection.rtl,
            style: TextStyle(color: Colors.white, fontSize: 12.sp, height: 1.7),
          ),
          SizedBox(height: 64.h),
          CustomButton(
            icon: Icons.rocket_launch,
            text: 'ابدأ التعلم الآن',
            backgroundColor: AppColor.secondaryColor,
            textColor: AppColor.primaryColor,
          ),
          SizedBox(height: 24.h),
          CustomButton(
            icon: Icons.lock_outline,
            text: 'تسجيل الدخول',
            backgroundColor: AppColor.primaryColor,
          ),
        ],
      ),
    );
  }
}
