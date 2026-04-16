import 'package:aladeep/core/bloc/paginated_bloc/exports.dart';
import 'package:aladeep/core/enum/status.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils/app_drawer.dart';
import 'package:aladeep/core/utils/header.dart';
import 'package:aladeep/features/home/presentation/sections/footer_section.dart';
import 'package:aladeep/features/my_platform/data/models/my_result_model.dart';
import 'package:aladeep/features/my_platform/presentation/bloc/my_results_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' hide TextDirection;

class MyResultsView extends StatelessWidget {
  const MyResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.all(24.w),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        children: [
                          // Banner
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(24.r),
                            decoration: BoxDecoration(
                              color: AppColors.primaryDark,
                              borderRadius: BorderRadius.circular(16),
                              // image: const DecorationImage(
                              //   image: AssetImage(
                              //     'assets/images/pattern.png',
                              //   ), // Placeholder or subtle pattern
                              //   opacity: 0.1,
                              //   fit: BoxFit.cover,
                              // ),
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
                                          color: Colors.white.withValues(
                                            alpha: 0.8,
                                          ),
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
                                  child: Icon(
                                    Icons.emoji_events_rounded,
                                    color: AppColors.primaryDark,
                                    size: 30.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24.h),

                          // Results List
                          BlocBuilder<MyResultsBloc, BaseState<MyResultModel>>(
                            builder: (context, state) {
                              if (state.status == Status.loading &&
                                  state.items.isEmpty) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              if (state.status == Status.failure &&
                                  state.items.isEmpty) {
                                return Center(
                                  child: Text(
                                    state.errorMessage ??
                                        'حدث خطأ في جلب النتائج',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                );
                              }

                              if (state.items.isEmpty) {
                                return const Center(
                                  child: Text('لا توجد نتائج حالياً'),
                                );
                              }

                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.items.length,
                                itemBuilder: (context, index) {
                                  final result = state.items[index];
                                  return _buildResultCard(result);
                                },
                              );
                            },
                          ),
                          SizedBox(height: 24.h),
                        ],
                      ),
                    ),
                  ),
                  const FooterSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard(MyResultModel result) {
    Color iconColor;
    IconData icon;

    if (result.scorePercentage < 50) {
      iconColor = Colors.red;
      icon = Icons.sentiment_dissatisfied;
    } else if (result.scorePercentage < 75) {
      iconColor = Colors.orange;
      icon = Icons.sentiment_neutral;
    } else {
      iconColor = const Color(0xFF248566);
      icon = Icons.sentiment_very_satisfied;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row in Card
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: iconColor, size: 28.sp),
              Text(
                result.quizTitle,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(color: Colors.grey.shade100, thickness: 1.5),
          SizedBox(height: 16.h),

          // Details
          _buildInfoRow(
            'التاريخ:',
            DateFormat('yyyy/MM/dd HH:mm').format(result.dateTaken),
            isLtr: true,
          ),
          SizedBox(height: 12.h),
          _buildInfoRow('الكورس:', result.courseTitle, isLtr: false),
          SizedBox(height: 12.h),
          _buildInfoRow(
            'الإجابات الصحيحة:',
            '${result.totalQuestions} / ${result.correctAnswers}',
            isLtr: true,
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${result.scorePercentage}%',
                  style: TextStyle(
                    color: iconColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Text(
                'النسبة المئوية:',
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, {bool isLtr = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
          style: TextStyle(
            color: AppColors.primaryDark,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
        Text(
          textDirection: TextDirection.rtl,
          title,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 13.sp),
        ),
      ],
    );
  }
}
