import 'package:aladeep/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.secondaryColor),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu, size: 24.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
