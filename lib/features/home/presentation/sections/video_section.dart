import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/features/home/presentation/sections/videoPlayerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:aladeep/features/home/data/models/home_model.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoSection extends StatelessWidget {
  final SettingsModel? settings;
  const VideoSection({super.key, this.settings});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0D2B45), Color(0xFF0A1F2E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Text(
            'اكتشف منصة الأديب',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryGold,
            ),
          ),

          SizedBox(height: 8.h),

          Text(
            'شاهد كيف نصنع التفوق ونغير مفهوم المذاكرة التقليدية',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 13.sp,
              height: 1.6,
            ),
          ),

          SizedBox(height: 28.h),

          // Video placeholder
          Container(
            width: double.infinity,
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.primaryGold.withValues(alpha: 0.3),
                width: 1.5,
              ),
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryDark.withValues(alpha: 0.8),
                  const Color(0xFF0A1F2E),
                ],
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Decorative circles
                Positioned(
                  top: -20,
                  right: -20,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryGold.withValues(alpha: 0.06),
                    ),
                  ),
                ),

                // Play button
                // GestureDetector(
                //   onTap: () {
                //     if (settings?.promoVideoUrl != null) {
                //       // Navigate or play video
                //       debugPrint(
                //         'Playing promo video: ${settings?.promoVideoUrl}',
                //       );
                //       launchUrl(Uri.parse(settings!.promoVideoUrl!));
                //     }
                //   },
                //   child: Container(
                //     padding: EdgeInsets.all(18.r),
                //     decoration: BoxDecoration(
                //       color: AppColors.primaryGold,
                //       shape: BoxShape.circle,
                //       boxShadow: [
                //         BoxShadow(
                //           color: AppColors.primaryGold.withValues(alpha: 0.4),
                //           blurRadius: 20,
                //           spreadRadius: 2,
                //         ),
                //       ],
                //     ),
                //     child: Icon(
                //       Icons.play_arrow_rounded,
                //       color: AppColors.primaryDark,
                //       size: 36.sp,
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    if (settings?.promoVideoUrl != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => VideoPlayerScreen(
                            videoUrl: settings!.promoVideoUrl!,
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(18.r),
                    decoration: BoxDecoration(
                      color: AppColors.primaryGold,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: AppColors.primaryDark,
                      size: 36.sp,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 14,
                  left: 0,
                  right: 0,
                  child: Text(
                    'اضغط لمشاهدة الفيديو التعريفي',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.5),
                      fontSize: 11.sp,
                    ),
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
