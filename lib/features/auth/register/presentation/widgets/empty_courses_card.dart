import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmptyCoursesCard extends StatelessWidget {
  const EmptyCoursesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 120.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 55.r,
            backgroundColor: AppColors.primaryLightGold.withValues(alpha: 0.6),
            child: FaIcon(
              FontAwesomeIcons.gift,
              size: 42.sp,
              color: AppColors.primaryGold,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            "لا توجد دورات مفعلة بعد",
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDark,
            ),
          ),

          SizedBox(height: 16.h),

          const Text(
            textDirection: TextDirection.rtl,
            "لم تقم بالاشتراك في أي دورة حتى الآن، أو أن طلبك لا يزال قيد المراجعة من الإدارة.",
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          CustomButton(
            text: "تصفح الدورات المتاحة الآن",
            textColor: AppColors.primaryDarker,
          ),
        ],
      ),
    );
  }
}
