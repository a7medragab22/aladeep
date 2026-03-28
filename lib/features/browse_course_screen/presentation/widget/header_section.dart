import 'package:aladeep/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.primaryGold.withValues(alpha: 0.5),
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.primaryLightGold.withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: Text(
                  'الشفافيه والامان',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColor.primaryGold,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'سياسة الخصوصية',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryDarker,
                ),
              ),
              Text(
                'والشروط',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryGold,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Text(
            textDirection: TextDirection.rtl,
            'نلتزم بحماية بياناتك وتقديم بيئة تعليمية آمنة وموثوقة.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColor.primaryDark),
          ),
        ],
      ),
    );
  }
}
