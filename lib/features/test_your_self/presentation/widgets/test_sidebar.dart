import 'package:aladeep/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestSidebar extends StatelessWidget {
  const TestSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w, // Fixed width for sidebar on wide screens
      color: AppColors.primaryGreen, // The dark green matching the sidebar
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'قسم الاختبار الحالي',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 16.sp),
          ),
          SizedBox(height: 12.h),
          Text(
            'المفردة\nالشاذة',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
