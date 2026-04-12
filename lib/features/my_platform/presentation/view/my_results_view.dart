import 'package:aladeep/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyResultsView extends StatelessWidget {
  const MyResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'سجل الإنجاز والدرجات',
          style: TextStyle(
            color: AppColors.primaryDark,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryDark),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            // Banner
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24.r),
              decoration: BoxDecoration(
                color: AppColors.primaryDark,
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage('assets/images/pattern.png'), // Placeholder or subtle pattern
                  opacity: 0.1,
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'سجل التميز والدرجات',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'تابع تطور مستواك بدقة في اختبارات القدرات اللفظي بنجاح.',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      color: AppColors.primaryGold,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.emoji_events_rounded, color: AppColors.primaryDark, size: 30.sp),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // Table Header
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                   _buildHeaderCell('التقييم', 1),
                   _buildHeaderCell('النسبة المئوية', 1.5),
                   _buildHeaderCell('الإجابات الصحيحة', 1.5),
                   _buildHeaderCell('التاريخ', 1.5),
                   _buildHeaderCell('الاختبار التطبيقي', 2),
                ],
              ),
            ),

            // Table Rows (Mock Data)
            _buildResultRow('2026-04-12', '1 / 0', '0%', Icons.sentiment_very_dissatisfied, Colors.red),
            _buildResultRow('2026-04-10', '1 / 0', '0%', Icons.sentiment_very_dissatisfied, Colors.red),
            
            // Just for visual completeness as per image
            Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.grey.shade200),
                  right: BorderSide(color: Colors.grey.shade200),
                  bottom: BorderSide(color: Colors.grey.shade200),
                ),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text, double flex) {
    return Expanded(
      flex: (flex * 10).toInt(),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }

  Widget _buildResultRow(String date, String score, String percentage, IconData icon, Color iconColor) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(color: Colors.grey.shade200),
          right: BorderSide(color: Colors.grey.shade200),
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: Icon(icon, color: iconColor, size: 24.sp),
          ),
          Expanded(
            flex: 15,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                percentage,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 13.sp),
              ),
            ),
          ),
          Expanded(
            flex: 15,
            child: Text(
              score,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.bold, fontSize: 13.sp),
            ),
          ),
          Expanded(
            flex: 15,
            child: Text(
              date,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade500, fontSize: 12.sp),
            ),
          ),
          Expanded(
            flex: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.assignment_turned_in_rounded, size: 16.sp, color: AppColors.primaryDark),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
