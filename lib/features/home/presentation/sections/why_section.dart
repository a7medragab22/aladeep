import 'package:aladeep/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhySection extends StatelessWidget {
  const WhySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      child: Column(
        children: [
          // Top label
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.primaryGold.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.primaryGold.withValues(alpha: 0.3),
              ),
            ),
            child: Text(
              'لماذا نحن؟',
              style: TextStyle(
                color: AppColors.primaryGold,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          SizedBox(height: 16.h),

          Text(
            'لماذا منصة الأديب\nهي خيارك الأفضل؟',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDark,
              height: 1.4,
            ),
          ),

          SizedBox(height: 10.h),

          Text(
            'نحن لا نقدم مجرد فيديوهات مسجلة، بل نصنع تجربة تعليمية تفاعلية متكاملة تقودك نحو الـ 100%.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryDark.withValues(alpha: 0.6),
              fontSize: 13.sp,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}
