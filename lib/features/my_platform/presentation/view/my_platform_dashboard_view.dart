import 'package:aladeep/core/bloc/paginated_bloc/exports.dart';
import 'package:aladeep/core/enum/status.dart';
import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils/app_drawer.dart';
import 'package:aladeep/core/utils/header.dart';
import 'package:aladeep/features/my_platform/data/models/my_course_model.dart';
import 'package:aladeep/features/my_platform/presentation/bloc/my_platform_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'package:aladeep/core/helpers/cache_helper.dart';
import 'package:aladeep/features/auth/models/customer_model.dart';

class MyPlatformDashboardView extends StatefulWidget {
  const MyPlatformDashboardView({super.key});

  @override
  State<MyPlatformDashboardView> createState() =>
      _MyPlatformDashboardViewState();
}

class _MyPlatformDashboardViewState extends State<MyPlatformDashboardView> {
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  void _loadUserName() {
    try {
      final userJson = CacheHelper.getData(key: 'user');
      if (userJson != null) {
        final Map<String, dynamic> userMap = jsonDecode(userJson);
        final user = CustomerModel.fromJson(userMap);
        setState(() {
          _userName =
              (user.fullName != null && user.fullName!.trim().isNotEmpty)
              ? user.fullName!
              : 'طالب';
        });
      } else {
        setState(() {
          _userName = 'طالب';
        });
      }
    } catch (e) {
      setState(() {
        _userName = 'طالب';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child:
                      BlocBuilder<
                        MyPlatformBloc,
                        BaseState<List<MyCourseModel>>
                      >(
                        builder: (context, state) {
                          return ListView(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            children: [
                              _buildWelcomeSection(),
                              SizedBox(height: 24.h),
                              _buildCoursesHeader(),
                              if (state.status == Status.loading)
                                const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(40.0),
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              else if (state.status == Status.success &&
                                  (state.data?.isNotEmpty ?? false))
                                _buildCoursesList(state.data!)
                              else
                                _buildEmptyState(),
                              SizedBox(height: 40.h),
                            ],
                          );
                        },
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryDark.withValues(alpha: 0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
        gradient: LinearGradient(
          colors: [AppColors.primaryDark, const Color(0xff124a7d)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'مرحباً بك\n $_userName!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'استكمل رحلة تفوقك واجتياز اختبارات القدرات اللفظي بنجاح.',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.8),
                        fontSize: 12.sp,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              // Profile circle
              Container(
                width: 54.r,
                height: 54.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primaryGold.withValues(alpha: 0.6),
                    width: 2.5,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/user_placeholder.png',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Center(
                      child: Text(
                        _userName.isNotEmpty ? _userName[0] : '',
                        style: TextStyle(
                          color: AppColors.primaryGold,
                          fontWeight: FontWeight.bold,
                          fontSize: 26.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 28.h),
          _buildActionButton(
            title: 'استكشف الدورات المتاحة',
            icon: Icons.explore_outlined,
            onTap: () =>
                Navigator.pushNamed(context, AppRoutsName.browsecourseView),
          ),
          SizedBox(height: 12.h),
          _buildActionButton(
            title: 'نتائجي وتقييمي الدراسي',
            icon: Icons.auto_graph_rounded,
            isSecondary: true,
            onTap: () => Navigator.pushNamed(context, AppRoutsName.myResults),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String title,
    required IconData icon,
    bool isSecondary = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        decoration: BoxDecoration(
          color: isSecondary
              ? Colors.white.withValues(alpha: 0.08)
              : AppColors.primaryGold,
          borderRadius: BorderRadius.circular(16),
          border: isSecondary
              ? Border.all(color: Colors.white.withValues(alpha: 0.25))
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isSecondary ? Colors.white : AppColors.primaryDark,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10.w),
            Icon(
              icon,
              color: isSecondary ? Colors.white : AppColors.primaryDark,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoursesHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'دوراتي التعليمية',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDark,
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: AppColors.primaryDark.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.school_rounded,
              color: AppColors.primaryDark,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoursesList(List<MyCourseModel> courses) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(20.r),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return Container(
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade100),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutsName.courseDetailsView,
                arguments: course.id,
              );
            },
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        course.title ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: AppColors.primaryDark,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        course.description ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'نشط حتى: ${course.expiryDate?.split('T').first ?? ''}',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.w),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://al-adeep.com${course.imageUrl}',
                    width: 90.w,
                    height: 90.w,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 90.w,
                      height: 90.w,
                      color: Colors.grey.shade100,
                      child: const Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Column(
      children: [
        SizedBox(height: 40.h),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          padding: EdgeInsets.all(32.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Column(
            children: [
              Container(
                width: 100.w,
                height: 100.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryGold.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.inventory_2_outlined,
                    size: 40.sp,
                    color: AppColors.primaryGold,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'لا توجد دورات مفعلة بعد',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDark,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'لم تقم بالاشتراك في أي دورة حتى الآن، أو أن طلبك لا يزال قيد المراجعة من الإدارة.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
              SizedBox(height: 32.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    AppRoutsName.browsecourseView,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGold,
                    foregroundColor: AppColors.primaryDark,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'تصفح الدورات المتاحة الآن',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
