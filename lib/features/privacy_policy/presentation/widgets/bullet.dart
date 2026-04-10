import 'package:aladeep/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bullet extends StatelessWidget {
  final String text;

  const Bullet({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            textDirection: TextDirection.rtl,

            style: TextStyle(fontSize: 12.sp, color: AppColors.primaryDark),
          ),
          SizedBox(width: 6.w),
          FaIcon(
            FontAwesomeIcons.circleCheck,
            size: 14.sp,
            color: AppColors.primaryGold,
          ),
        ],
      ),
    );
  }
}
