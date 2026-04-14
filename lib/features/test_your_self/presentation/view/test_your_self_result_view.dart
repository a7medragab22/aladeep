import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/features/test_your_self/data/models/quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestYourSelfResultView extends StatelessWidget {
  final QuizResultModel result;

  const TestYourSelfResultView({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color scoreColor;
    String commentText;
    
    double scorePercentage = result.score;

    if (scorePercentage < 50) {
      scoreColor = Colors.red.shade600;
      commentText = 'لم يتم اجتياز الاختبار. يمكنك المراجعة والمحاولة لاحقاً.';
    } else if (scorePercentage < 75) {
      scoreColor = Colors.orange.shade600;
      commentText = 'النتيجة جيدة، لكن يمكنك تحسين مستواك.';
    } else {
      scoreColor = const Color(0xFF248566); // Green
      commentText = 'ممتاز! لقد اجتزت الاختبار بنجاح مبهر.';
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Container(
            width: 500.w, // Max card width for tablet/web
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 48.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: const Color(0xFF248566).withValues(alpha: 0.5), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2F3EB), // Light green background
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.assessment_rounded, // Similar to the document icon
                    color: const Color(0xFF248566),
                    size: 50.sp,
                  ),
                ),
                SizedBox(height: 24.h),

                // Title
                Text(
                  'تقرير نتيجة الاختبار',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                  ),
                ),
                SizedBox(height: 16.h),

                // Percentage
                Text(
                  '$scorePercentage%',
                  style: TextStyle(
                    fontSize: 64.sp,
                    fontWeight: FontWeight.w900,
                    color: scoreColor,
                  ),
                ),
                SizedBox(height: 16.h),

                // Comment
                Text(
                  commentText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 48.h),

                // Return Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutsName.myResults,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF248566),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'العودة للوحة التحكم',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
