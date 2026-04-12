import 'package:aladeep/core/enum/status.dart';
import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils/header.dart';
import 'package:aladeep/features/course/presentation/bloc/course_details_bloc.dart';
import 'package:aladeep/features/course/data/models/course_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:aladeep/core/service_locator/service_locator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CourseDetailsView extends StatefulWidget {
  final int courseId;
  const CourseDetailsView({super.key, required this.courseId});

  @override
  State<CourseDetailsView> createState() => _CourseDetailsViewState();
}

class _CourseDetailsViewState extends State<CourseDetailsView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CourseDetailsBloc>()..add(FetchCourseDetails(widget.courseId)),
      child: BlocBuilder<CourseDetailsBloc, CourseDetailsState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state.status == Status.failure) {
            return Scaffold(
              body: Center(child: Text(state.errorMessage ?? 'Error')),
            );
          }

          final course = state.course;
          if (course == null) return const SizedBox();

          return Scaffold(
            key: _scaffoldKey,
            backgroundColor: const Color(0xFFF6F9FC),
            endDrawer: _buildCurriculumDrawer(context, course, state),
            body: SafeArea(
              child: Column(
                children: [
                  _buildTopNav(context, course),
                  _buildContentAlert(course),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(flex: 3, child: _buildMainContent(state)),
                        _buildContentDetails(course, state),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTopNav(BuildContext context, CourseDetailsModel course) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          // Left side: Exit and Portfolio button
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  Icons.close_rounded,
                  color: Colors.grey.shade600,
                  size: 24.sp,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),

          const Spacer(),

          // Right side: Tabs and Menu
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: _buildNavTab("المسابقات", Icons.emoji_events_outlined),
                ),
                Flexible(
                  child: _buildNavTab("النقاشات", Icons.chat_bubble_outline),
                ),
                Flexible(
                  child: _buildNavTab(
                    "المنهج",
                    Icons.menu_book,
                    isActive: true,
                  ),
                ),
                SizedBox(width: 4.w),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    Icons.more_vert_rounded,
                    color: AppColors.primaryDark,
                    size: 24.sp,
                  ),
                  onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavTab(String title, IconData icon, {bool isActive = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                    color: isActive
                        ? AppColors.primaryDark
                        : Colors.grey.shade600,
                  ),
                ),
              ),
              SizedBox(width: 2.w),
              Icon(
                icon,
                size: 14.sp,
                color: isActive ? AppColors.primaryDark : Colors.grey.shade600,
              ),
            ],
          ),
          if (isActive)
            Container(
              height: 2,
              width: 24.w,
              margin: EdgeInsets.only(top: 4.h),
              decoration: BoxDecoration(
                color: AppColors.primaryLightGold,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContentAlert(CourseDetailsModel course) {
    return Container(
      margin: EdgeInsets.all(12.r),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xffFEF2F2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffFECACA)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: Colors.red.shade700,
                size: 20.sp,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  'عفواً، لقد انتهت صلاحية اشتراكك في هذه الدورة. يمكنك فقط مشاهدة المقاطع التجريبية المجانية.',
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.red.shade800,
                    fontSize: 11.sp,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryDark,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutsName.confirmSubscription,
                  arguments: {
                    'courseId': course.id,
                    'price': course.price,
                  },
                );
              },
              child: const Text('اشترك في الدورة الآن'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(CourseDetailsState state) {
    final material = state.selectedMaterial;

    if (material == null) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A), // Modern dark blue
          image: DecorationImage(
            image: NetworkImage(
              "https://al-adeep.com${state.course?.imageUrl ?? ''}",
            ),
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  color: AppColors.primaryGold.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.play_circle_filled_rounded,
                  size: 80.sp,
                  color: AppColors.primaryGold,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                state.course?.title ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'اختر درساً من القائمة الجانبية لبدء المذاكرة',
                  style: TextStyle(color: Colors.white70, fontSize: 13.sp),
                ),
              ),
            ],
          ),
        ),
      );
    }

    String rawUrl = material.url ?? '';

    // Fallback logic
    if (rawUrl.isEmpty) {
      if (material.materialType == 'PDF') {
        rawUrl =
            "https://docs.google.com/viewerng/viewer?url=https://bookslibrary.com/files/books-library.com-05271506Fx6W3.pdf";
      } else if (material.materialType == 'YouTube') {
        rawUrl = "https://youtube.com/shorts/5DXhwicXIjk?si=nID8555Ws2-xuKss";
      }
    }

    if (rawUrl.isEmpty) {
      return const Center(child: Text("رابط المحتوى غير متوفر"));
    }

    // Handle relative URLs (if any from API)
    String fullUrl = rawUrl;
    if (!rawUrl.startsWith('http')) {
      if (rawUrl.startsWith('/')) {
        fullUrl = "https://al-adeep.com$rawUrl";
      } else if (rawUrl.isNotEmpty) {
        // If it looks like a domain but missing scheme
        if (rawUrl.contains('.') && !rawUrl.contains('/')) {
          fullUrl = "https://$rawUrl";
        } else {
          fullUrl = "https://al-adeep.com/$rawUrl";
        }
      }
    }

    if (material.materialType == 'YouTube') {
      final videoId = YoutubePlayer.convertUrlToId(fullUrl);
      if (videoId == null)
        return const Center(child: Text("رابط فيديو غير صالح"));

      return YouTubePlayerWidget(videoId: videoId);
    }

    if (material.materialType == 'PDF') {
      try {
        final uri = Uri.tryParse(fullUrl);
        if (uri == null || !uri.isAbsolute) {
          return const Center(child: Text("رابط غير صالح أو غير مطلق"));
        }
        return WebViewWidget(
          controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..loadRequest(uri),
        );
      } catch (e) {
        return const Center(child: Text("خطأ في عرض الملف"));
      }
    }

    return const Center(child: Text("نوع محتوى غير مدعوم"));
  }

  Widget _buildContentDetails(
    CourseDetailsModel course,
    CourseDetailsState state,
  ) {
    return Container(
      padding: EdgeInsets.all(24.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            offset: const Offset(0, -5),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryGold.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  state.selectedMaterial?.materialType ?? 'درس',
                  style: TextStyle(
                    color: AppColors.primaryGold,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                child: Text(
                  state.selectedMaterial?.title ?? course.title ?? '',
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18.sp,
                    height: 1.4,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                course.trainerName ?? '',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 8.w),
              Icon(
                Icons.person_pin_rounded,
                color: Colors.grey.shade400,
                size: 20.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCurriculumDrawer(
    BuildContext context,
    CourseDetailsModel course,
    CourseDetailsState state,
  ) {
    return Drawer(
      width: 0.8.sw,
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            height: 140.h,
            padding: EdgeInsets.only(top: 40.h),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryDark, Color(0xFF1E293B)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.menu_book_rounded,
                    color: AppColors.primaryGold,
                    size: 32.sp,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'المنهج الدراسي',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: course.lessons.length,
              itemBuilder: (context, index) {
                final lesson = course.lessons[index];
                return ExpansionTile(
                  initiallyExpanded: index == 0,
                  title: Text(
                    lesson.title ?? '',
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.library_books, size: 20),
                  children: [
                    ...lesson.materials.map(
                      (mat) => ListTile(
                        onTap: mat.isFreeSample == true
                            ? () {
                                context.read<CourseDetailsBloc>().add(
                                  SelectMaterial(mat),
                                );
                                Navigator.pop(context);
                              }
                            : null,
                        title: Text(
                          mat.title ?? '',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: mat.isFreeSample == true
                                ? Colors.black87
                                : Colors.grey,
                          ),
                        ),
                        subtitle: Text(
                          mat.materialType ?? '',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                        ),
                        leading: Icon(
                          mat.isFreeSample == true
                              ? Icons.play_circle
                              : Icons.lock,
                          color: mat.isFreeSample == true
                              ? AppColors.primaryLightGold
                              : Colors.grey,
                        ),
                      ),
                    ),
                    ...lesson.quizzes.map(
                      (quiz) => ListTile(
                        title: Text(
                          quiz.title ?? '',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                        ),
                        leading: const Icon(Icons.quiz, color: Colors.grey),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class YouTubePlayerWidget extends StatefulWidget {
  final String videoId;
  const YouTubePlayerWidget({super.key, required this.videoId});

  @override
  State<YouTubePlayerWidget> createState() => _YouTubePlayerWidgetState();
}

class _YouTubePlayerWidgetState extends State<YouTubePlayerWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );
  }

  @override
  void didUpdateWidget(YouTubePlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoId != widget.videoId) {
      _controller.load(widget.videoId);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: AppColors.primaryGold,
    );
  }
}
