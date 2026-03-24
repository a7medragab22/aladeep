import 'package:aladeep/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialIcon extends StatelessWidget {
  final IconData icon;
  const SocialIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9.r),
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.primaryColor.withValues(alpha: 0.1)),
      ),
      child: Icon(
        icon,
        color: AppColor.primaryColor.withValues(alpha: 0.6),
        size: 18.sp,
      ),
    );
  }
}
