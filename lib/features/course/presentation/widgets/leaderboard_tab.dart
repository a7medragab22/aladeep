import 'package:aladeep/core/enum/status.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/features/course/data/models/leaderboard_model.dart';
import 'package:aladeep/features/course/presentation/bloc/leaderboard_bloc/leaderboard_bloc.dart';
import 'package:aladeep/features/course/presentation/bloc/leaderboard_bloc/leaderboard_event.dart';
import 'package:aladeep/core/bloc/paginated_bloc/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_line/dotted_line.dart';

class LeaderboardTab extends StatefulWidget {
  final int courseId;

  const LeaderboardTab({super.key, required this.courseId});

  @override
  State<LeaderboardTab> createState() => _LeaderboardTabState();
}

class _LeaderboardTabState extends State<LeaderboardTab> {
  @override
  void initState() {
    super.initState();
    context.read<LeaderboardBloc>().add(FetchLeaderboard(widget.courseId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaderboardBloc, BaseState<LeaderboardModel>>(
      builder: (context, state) {
        if (state.status == Status.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status == Status.failure) {
          return Center(child: Text(state.errorMessage ?? 'حدث خطأ ما'));
        }

        final leaderboard = state.items;

        return RefreshIndicator(
          onRefresh: () async {
            context.read<LeaderboardBloc>().add(
              FetchLeaderboard(widget.courseId),
            );
          },
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            children: [
              // Header section
              Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.emoji_events_rounded,
                      color: Color(0xFFEAB308), // Trophy gold
                      size: 60.sp,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'لوحة شرف الدورة',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDark,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'ترتيب أفضل الطلاب بناءً على متوسط درجاتهم',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              DottedLine(
                direction: Axis.horizontal,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: Colors.grey.shade300,
                dashGapLength: 4.0,
              ),
              SizedBox(height: 24.h),

              // Leaderboard list
              ...leaderboard.asMap().entries.map((entry) {
                final index = entry.key;
                final student = entry.value;
                return _LeaderboardItem(rank: index + 1, student: student);
              }),
            ],
          ),
        );
      },
    );
  }
}

class _LeaderboardItem extends StatelessWidget {
  final int rank;
  final LeaderboardModel student;

  const _LeaderboardItem({required this.rank, required this.student});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Rank badge
          Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
              color: Color(0xFFFACC15), // Rank badge gold
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFACC15).withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                '$rank',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          // Student details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  student.studentName ?? 'طالب مجهول',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'اجتاز ${student.totalExamsTaken ?? 0} اختبارات',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 12.sp, color: AppColors.textGrey),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          // Score badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Color(0xFFFEF9C3), // Light gold score badge
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Text(
              '${student.averageScore?.toInt() ?? 0}%',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xFFA16207), // Dark gold score text
              ),
            ),
          ),
        ],
      ),
    );
  }
}
