import 'package:aladeep/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FieldLabel extends StatelessWidget {
  final String label;
  const FieldLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: AppColors.primaryDark,
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
