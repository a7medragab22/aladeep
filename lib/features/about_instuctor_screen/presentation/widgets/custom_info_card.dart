import 'package:aladeep/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomInfoCard extends StatelessWidget {
  final String title;
  final String description;
  final FaIconData icon;

  const CustomInfoCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColor.primaryDark,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: FaIcon(icon, size: 22.sp, color: AppColor.primaryGold),
          ),
          SizedBox(height: 16.h),
          Text(
            title,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryDark,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            textDirection: TextDirection.rtl,
            description,
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColor.primaryDark,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
