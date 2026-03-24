import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeatureRow extends StatelessWidget {
  final String text;
  const FeatureRow({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 16.r,
            color: const Color(0xFFD4AF37),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white.withOpacity(0.9),
                fontFamily: 'Cairo',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
