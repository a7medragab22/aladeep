import 'package:aladeep/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoSection extends StatelessWidget {
  const VideoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0D2B45), Color(0xFF123D5C)],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 20.h),

          Text(
            "اكتشف منصة الأديب",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.secondaryColor,
            ),
          ),

          SizedBox(height: 10.h),

          Text(
            "شاهد كيف نصنع التفوق ونغير مفهوم المذاكرة التقليدية",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
          ),

          const SizedBox(height: 20),

          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: SizedBox(),
              //  PlayerYouTubeVideo(),
            ),
          ),
        ],
      ),
    );
  }
}
