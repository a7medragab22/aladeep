import 'package:aladeep/core/bloc/paginated_bloc/exports.dart';
import 'package:aladeep/core/enum/status.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/features/course/data/models/discussion_model.dart';
import 'package:aladeep/features/course/presentation/bloc/discussions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscussionCommentCard extends StatelessWidget {
  final DiscussionModel discussion;
  final int courseId;

  const DiscussionCommentCard({
    super.key,
    required this.discussion,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildHeader(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Text(
              discussion.content,
              style: TextStyle(
                fontSize: 14.sp,
                height: 1.5,
                color: AppColors.primaryDark,
              ),
            ),
          ),
          if (discussion.replies.isNotEmpty) ...[
            const Divider(height: 1),
            ...discussion.replies.map((reply) => _buildReply(reply)),
          ],
          _buildReplyInput(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                discussion.userName,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDark,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                discussion.createdAt,
                style: TextStyle(fontSize: 10.sp, color: Colors.grey.shade500),
              ),
            ],
          ),
          SizedBox(width: 12.w),
          CircleAvatar(
            radius: 20.r,
            backgroundColor: Colors.grey.shade100,
            child: Text(
              discussion.userName.isNotEmpty ? discussion.userName[0] : 'U',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDark,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReply(DiscussionModel reply) {
    return Container(
      margin: EdgeInsets.only(top: 8.h, right: 16.w, left: 16.w, bottom: 8.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12.r),
        border: const Border(
          right: BorderSide(color: AppColors.primaryGold, width: 3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    reply.userName,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  Text(
                    reply.createdAt,
                    style: TextStyle(
                      fontSize: 9.sp,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 8.w),
              CircleAvatar(
                radius: 14.r,
                backgroundColor: Colors.white,
                child: Text(
                  reply.userName.isNotEmpty ? reply.userName[0] : 'U',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            reply.content,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.primaryDark.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReplyInput(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Container(
      padding: EdgeInsets.all(12.r),
      child: Row(
        children: [
          BlocBuilder<DiscussionsBloc, BaseState<DiscussionModel>>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: state.status == Status.loading
                    ? null
                    : () {
                        if (controller.text.isNotEmpty) {
                          context.read<DiscussionsBloc>().add(
                            AddReply(
                              postId: discussion.id,
                              courseId: courseId,
                              content: controller.text,
                            ),
                          );
                          controller.clear();
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffEFF6FF),
                  foregroundColor: AppColors.primaryDark,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: state.status == Status.loading
                    ? const SizedBox(
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('رد'),
              );
            },
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'اكتب رداً...',
                hintStyle: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey.shade400,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 8.h,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              style: TextStyle(fontSize: 13.sp),
            ),
          ),
        ],
      ),
    );
  }
}
