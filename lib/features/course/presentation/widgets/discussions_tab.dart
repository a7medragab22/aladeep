import 'package:aladeep/core/bloc/paginated_bloc/exports.dart';
import 'package:aladeep/core/enum/status.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/features/course/data/models/discussion_model.dart';
import 'package:aladeep/features/course/presentation/bloc/discussions_bloc.dart';
import 'package:aladeep/features/course/presentation/widgets/discussion_comment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscussionsTab extends StatefulWidget {
  final int courseId;
  const DiscussionsTab({super.key, required this.courseId});

  @override
  State<DiscussionsTab> createState() => _DiscussionsTabState();
}

class _DiscussionsTabState extends State<DiscussionsTab> {
  final TextEditingController _questionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<DiscussionsBloc>().add(FetchDiscussions(widget.courseId));
  }

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscussionsBloc, BaseState<DiscussionModel>>(
      builder: (context, state) {
        if (state.status == Status.loading && state.items.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: () async {
            context.read<DiscussionsBloc>().add(FetchDiscussions(widget.courseId));
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                _buildInputSection(),
                if (state.items.isEmpty && state.status == Status.success)
                  Padding(
                    padding: EdgeInsets.only(top: 100.h),
                    child: Center(
                      child: Text(
                        'لا توجد نقاشات بعد. كن أول من يسأل!',
                        style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                      ),
                    ),
                  ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    return DiscussionCommentCard(
                      discussion: state.items[index],
                      courseId: widget.courseId,
                    );
                  },
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInputSection() {
    return Container(
      margin: EdgeInsets.all(16.r),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: _questionController,
            maxLines: 4,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              hintText:
                  'هل لديك سؤال حول محتوى الدورة؟ اطرحه هنا ليجيب عليه المدرب...',
              hintTextDirection: TextDirection.rtl,
              hintStyle: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey.shade400,
                height: 1.5,
              ),
              filled: true,
              fillColor: const Color(0xFFF8FAFC),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.all(16.r),
            ),
            style: TextStyle(fontSize: 14.sp, color: AppColors.primaryDark),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: 140.w,
            child: BlocBuilder<DiscussionsBloc, BaseState<DiscussionModel>>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: state.status == Status.loading 
                      ? null 
                      : () {
                          if (_questionController.text.isNotEmpty) {
                            context.read<DiscussionsBloc>().add(AddPost(
                                  courseId: widget.courseId,
                                  content: _questionController.text,
                                ));
                            _questionController.clear();
                            FocusScope.of(context).unfocus();
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryDark,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    elevation: 0,
                  ),
                  child: state.status == Status.loading && state.items.isNotEmpty
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.send_rounded, size: 18),
                            SizedBox(width: 8.w),
                            Text(
                              'نشر السؤال',
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
