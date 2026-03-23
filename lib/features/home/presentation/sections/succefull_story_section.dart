
import 'package:aladeep/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccefullStorysSection extends StatelessWidget {
  const SuccefullStorysSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        children: [
          Text(
            'قصص نجاح أبطالنا',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'آراء بعض الطلاب الذين حققوا طموحاتهم وتفوقوا في القدرات مع منصة الأديب.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColor.primaryColor, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
