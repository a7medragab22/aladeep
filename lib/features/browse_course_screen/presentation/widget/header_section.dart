import 'package:aladeep/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'استكشف برامجنا التدريبية',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDarker,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            textDirection: TextDirection.rtl,
            'باقات متنوعة مصممة خصيصاً لتأسيسك وتدريبك حتى تصل إلى العلامة الكاملة 100% في اختبارات القياس.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.primaryDark, fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
