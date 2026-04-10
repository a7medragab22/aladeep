import 'package:aladeep/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialIcon extends StatelessWidget {
  final FaIconData icon;
  const SocialIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9.r),
      decoration: BoxDecoration(
        color: AppColors.primaryDark.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primaryDark.withValues(alpha: 0.1)),
      ),
      child: FaIcon(
        icon,
        color: AppColors.primaryDark.withValues(alpha: 0.6),
        size: 18.sp,
      ),
    );
  }
}
