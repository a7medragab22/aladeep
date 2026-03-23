
import 'package:aladeep/core/themes/app_color.dart';
import 'package:aladeep/core/utils/custom_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestYourSelfSection extends StatelessWidget {
  const TestYourSelfSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 64.h),
      decoration: BoxDecoration(
        color: AppColor.secondaryColor.withValues(
          alpha: .2,
        ), 
        borderRadius: BorderRadius.circular(4),
      ),
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: const Radius.circular(24),
          dashPattern: const [8, 4],
          strokeWidth: 2.5,
          color: AppColor.secondaryColor,
          padding: EdgeInsets.zero,
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              Icon(
                Icons.assignment_turned_in,
                size: 80.sp,
                color: AppColor.secondaryColor,
              ),

              SizedBox(height: 20.h),

              Text(
                "أين تقف الآن؟ اختبر مستواك مجاناً",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  color: AppColor.primaryColor,
                  fontSize: 24,
                ),
              ),

              SizedBox(height: 16.h),

              Text(
                "دعنا نحدد مستواك الحالي بدقة عبر اختبار تشخيصي ذكي يحاكي اختبار قياس الفعلي. ستظهر نتيجتك فور الانتهاء لتعرف نقاط قوتك وضعفك والمسار الأنسب للتطوير.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  height: 1.6,
                  color: AppColor.primaryColor,
                  fontSize: 14.sp,
                ),
              ),

              SizedBox(height: 24.h),
              CustomButton(
                icon: Icons.arrow_back,
                text: 'ابدأ الاختبار التشخيصي',
                backgroundColor: AppColor.secondaryColor,
                textColor: AppColor.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
