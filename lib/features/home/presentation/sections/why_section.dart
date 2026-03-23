
import 'package:aladeep/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhySection extends StatelessWidget {
  const WhySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        children: [
          Text(
            "لماذا منصة الأديب هي خيارك الأفضل؟",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "نحن لا نقدم مجرد فيديوهات مسجلة، بل نصنع تجربة تعليمية تفاعلية متكاملة تقودك نحو الـ 100%.",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColor.primaryColor, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
