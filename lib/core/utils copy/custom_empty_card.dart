import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEmptyCard extends StatelessWidget {
  const CustomEmptyCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onButtonPressed,
    this.isHaveButton = true,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isHaveButton;
  final String buttonText;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Center(
          child: DottedBorder(
            options: RoundedRectDottedBorderOptions(
              radius: Radius.circular(20),
              dashPattern: [8, 6],
              strokeWidth: 2,
              color: Colors.grey,
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8FA),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// ICON
                  Container(
                    width: 80.w,
                    height: 80.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFEDEFF3),
                    ),
                    child: Icon(icon, size: 40.sp, color: Colors.grey),
                  ),

                  SizedBox(height: 20.h),

                  /// TITLE
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1B2B4B),
                    ),
                  ),

                  SizedBox(height: 10.h),

                  /// SUBTITLE
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),

                  SizedBox(height: 25.h),

                  /// BUTTON
                  isHaveButton
                      ? GestureDetector(
                          onTap: onButtonPressed,
                          child: Container(
                            width: 180.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF6A5AE0), Color(0xFF4B3FD3)],
                              ),
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: Center(
                              child: Text(
                                buttonText,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
