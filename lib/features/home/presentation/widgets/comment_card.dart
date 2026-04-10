import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/features/home/domain/entities/comment_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentCard extends StatelessWidget {
  final CommentEntity comment;

  const CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryDark.withValues(alpha: 0.05),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Header: quote icon + stars
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.format_quote_rounded,
                size: 32,
                color: Colors.black12,
              ),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star_rounded,
                    color: index < comment.rating
                        ? Colors.amber
                        : Colors.grey.shade200,
                    size: 16.sp,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          // Comment text
          Text(
            comment.comment,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 13.sp,
              height: 1.7,
              color: AppColors.primaryDark.withValues(alpha: 0.75),
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 16.h),
          Divider(color: Colors.grey.shade100),
          SizedBox(height: 12.h),

          // Footer: avatar + name + score
          Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.blue.shade900,
                child: Text(
                  comment.name.isNotEmpty ? comment.name[0] : '?',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ),

              const Spacer(),

              // Name + score
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    comment.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(
                        '${comment.score}% - ${comment.category}',
                        style: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.trending_up_rounded,
                        color: Colors.green,
                        size: 14.sp,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
