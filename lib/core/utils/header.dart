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
            height: 50.h,
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

          // Logo
          Image.asset('assets/images/logo.jpeg', height: 40.sp),
        ],
      ),
    );
  }
}
