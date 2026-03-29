import 'package:aladeep/core/themes/app_color.dart';
import 'package:aladeep/features/home/data/repo/comments_repository_impl.dart';
import 'package:aladeep/features/home/presentation/cubits/commentscubit/comments_cubit.dart';
import 'package:aladeep/features/home/presentation/cubits/commentscubit/comments_state.dart';
import 'package:aladeep/features/home/presentation/widgets/comment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CommentsCubit(CommentsRepositoryImpl())..getComments(),
      child: BlocBuilder<CommentsCubit, CommentsState>(
        builder: (context, state) {
          if (state is CommentsLoading) {
            return SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(40.r),
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primaryGold,
                    strokeWidth: 2,
                  ),
                ),
              ),
            );
          }

          if (state is CommentsError) {
            return SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(32.r),
                child: Center(
                  child: Text(
                    state.message,
                    style: TextStyle(
                      color: AppColor.primaryDark.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
            );
          }

          if (state is CommentsLoaded) {
            return SliverMainAxisGroup(
              slivers: [
                // Section header
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(
                      top: 32.h,
                      bottom: 20.h,
                      left: 20.w,
                      right: 20.w,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.primaryDark.withValues(alpha: 0.06),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'آراء الطلاب',
                            style: TextStyle(
                              color: AppColor.primaryDark,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'ماذا يقول طلابنا؟',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Comments list
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return CommentCard(comment: state.comments[index]);
                  }, childCount: state.comments.length),
                ),

                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 24.h,
                    child: Container(color: Colors.white),
                  ),
                ),
              ],
            );
          }

          return const SliverToBoxAdapter(child: SizedBox());
        },
      ),
    );
  }
}
