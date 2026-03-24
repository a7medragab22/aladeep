import 'package:aladeep/core/themes/app_color.dart';
import 'package:aladeep/features/browse_course_screen/presentation/widget/stat_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColor.primaryGreen, AppColor.lightGreen],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo
                  Row(
                    children: [
                      Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          color: AppColor.lightGold,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.menu_book_rounded,
                          color: AppColor.primaryGreen,
                          size: 20.r,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'الأديب',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ],
                  ),
                  // Back button
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16.r,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              // Title
              Text(
                'استكشف برامجنا التدريبية',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  height: 1.4,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'باقات متنوعة مصممة خصيصاً لتأسيسك وتدريبك حتى تصل إلى العلامة الكاملة 100%',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.white.withOpacity(0.85),
                  fontFamily: 'Cairo',
                  height: 1.6,
                ),
              ),
              SizedBox(height: 20.h),
              // Stats row
              Row(
                children: [
                  StatChip(icon: Icons.people_outline, label: '+10,000 طالب'),
                  SizedBox(width: 12.w),
                  StatChip(icon: Icons.star_outline, label: '100% رضا'),
                  SizedBox(width: 12.w),
                  StatChip(icon: Icons.headset_mic_outlined, label: 'دعم 24/7'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
