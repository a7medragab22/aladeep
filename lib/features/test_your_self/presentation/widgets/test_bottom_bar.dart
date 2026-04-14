import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestBottomBar extends StatelessWidget {
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;
  final VoidCallback onFinish;

  const TestBottomBar({
    super.key,
    this.onNext,
    this.onPrevious,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Mobile Layout
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildFinishButton(),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: TextDirection.rtl,
                  children: [
                    Expanded(child: _buildNavButton('التالي', onNext)),
                    SizedBox(width: 12.w),
                    Expanded(child: _buildNavButton('السابق', onPrevious)),
                  ],
                ),
              ],
            );
          } else {
            // Tablet/Web Layout
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                _buildFinishButton(),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    _buildNavButton('التالي', onNext),
                    SizedBox(width: 12.w),
                    _buildNavButton('السابق', onPrevious),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildFinishButton() {
    return ElevatedButton.icon(
      onPressed: onFinish,
      icon: const Icon(Icons.check, color: Colors.white, size: 20),
      label: Text(
        'إنهاء وتسليم الاختبار',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF248566), // Match image button color
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        elevation: 0,
      ),
    );
  }

  Widget _buildNavButton(String text, VoidCallback? onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.grey.shade300),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        backgroundColor: const Color(0xFFFAFAFA),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
