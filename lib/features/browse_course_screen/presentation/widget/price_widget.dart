import 'package:aladeep/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceWidget extends StatelessWidget {
  final String price;
  final String oldPrice;

  const PriceWidget({super.key, required this.price, required this.oldPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Text(
            "$oldPrice ريال",
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: const Color.fromARGB(255, 141, 62, 56),
              decoration: TextDecoration.lineThrough,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            price,
            style: const TextStyle(
              fontSize: 32,
              color: AppColors.primaryGold,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "ريال سعودي",
            style: TextStyle(color: Colors.white, fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
