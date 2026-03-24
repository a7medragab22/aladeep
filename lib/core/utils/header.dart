import 'package:aladeep/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: const BoxDecoration(color: Color(0xFF0A1F2E)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Menu button
          Container(
            width: 42.w,
            height: 42.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.primaryGold.withValues(alpha: 0.5),
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: Icon(Icons.menu, size: 22.sp, color: Colors.white),
              padding: EdgeInsets.zero,
            ),
          ),

          // Logo text
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'الأديب ',
                  style: TextStyle(
                    color: AppColor.primaryGold,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '|',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.3),
                    fontSize: 20.sp,
                  ),
                ),
                TextSpan(
                  text: ' القدرات',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
