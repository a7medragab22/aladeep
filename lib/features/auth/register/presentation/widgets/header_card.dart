import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCard extends StatelessWidget {
  final String userName;

  const HeaderCard({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final trimmedName = userName.trim();
    final displayName = trimmedName.isEmpty ? 'ضيف' : trimmedName.toUpperCase();
    final initialLetter = trimmedName.isEmpty
        ? 'ض'
        : trimmedName[0].toUpperCase();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 80.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [AppColors.primaryGold, AppColors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "مرحباً بك،",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    displayName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    textDirection: TextDirection.rtl,
                    "استكمل رحلة تفوقك واجتاز\nالقدرات اللفظي بنجاح.",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              SizedBox(width: 12.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.primaryGold),
                  color: Colors.transparent,
                ),
                child: Text(
                  initialLetter,
                  style: TextStyle(
                    color: AppColors.primaryGold,
                    fontSize: 26.sp,
                  ),
                ),
              ),
            ],
          ),

          /// Welcome Text
          const SizedBox(height: 44),

          /// Buttons
          CustomButton(
            text: "استكشاف الدورات",
            textColor: AppColors.primaryDarker,
            faIcon: FontAwesomeIcons.compass,
            isFaicon: true,
          ),

          const SizedBox(height: 18),
          CustomButton(
            text: "نتائجي وتقييمي",
            backgroundColor: Colors.transparent,
            textColor: AppColors.white,
            faIcon: FontAwesomeIcons.chartLine,
            borderColor: AppColors.textGrey,
            isFaicon: true,
          ),
        ],
      ),
    );
  }
}
