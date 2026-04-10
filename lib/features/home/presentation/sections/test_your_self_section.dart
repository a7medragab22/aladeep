import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils/custom_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestYourSelfSection extends StatelessWidget {
  const TestYourSelfSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      color: Colors.white,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: const Radius.circular(24),
          dashPattern: const [8, 4],
          strokeWidth: 2,
          color: AppColors.primaryGold.withValues(alpha: 0.6),
          padding: EdgeInsets.zero,
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 36.h, horizontal: 24.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryGold.withValues(alpha: 0.06),
                AppColors.primaryDark.withValues(alpha: 0.03),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              // Icon container
              Icon(
                Icons.assignment_turned_in_rounded,
                size: 52.sp,
                color: AppColors.primaryGold,
              ),

              SizedBox(height: 20.h),

              // Tag
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '✓ مجاناً بالكامل',
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              Text(
                'أين تقف الآن؟\nاختبر مستواك مجاناً',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  color: AppColors.primaryDark,
                  fontSize: 22.sp,
                ),
              ),

              SizedBox(height: 12.h),

              Text(
                'دعنا نحدد مستواك الحالي بدقة عبر اختبار تشخيصي ذكي يحاكي اختبار قياس الفعلي. ستظهر نتيجتك فور الانتهاء لتعرف نقاط قوتك وضعفك والمسار الأنسب للتطوير.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.7,
                  color: AppColors.primaryDark.withValues(alpha: 0.65),
                  fontSize: 13.sp,
                ),
              ),

              SizedBox(height: 24.h),

              CustomButton(
                icon: Icons.arrow_back,
                text: 'ابدأ الاختبار التشخيصي',
                backgroundColor: AppColors.primaryGold,
                textColor: AppColors.primaryDark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
