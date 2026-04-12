import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:aladeep/features/home/data/models/home_model.dart';
import 'package:aladeep/features/home/presentation/widgets/course_card.dart';

class BrouseCoursesSection extends StatelessWidget {
  final List<CourseSummaryModel> courses;
  const BrouseCoursesSection({super.key, this.courses = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 28.r, vertical: 80.h),
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            gradient: LinearGradient(
              colors: [AppColors.primaryGold, AppColors.primaryGold],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: AppColors.primaryGold.withOpacity(0.35)),
          ),
          child: Column(
            children: [
              Text(
                'هل أنت مستعد للوصول للقمة؟',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'لا تضيع المزيد من الوقت في المذاكرة العشوائية\n انضم لكتيبة الأديب الآن وابدأ رحلتك المضمونة نحو\n العلامة الكاملة.',
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.6),
                  fontSize: 12.sp,
                  height: 1.6,
                ),
              ),
              SizedBox(height: 44.h),
              CustomButton(
                text: 'تصفح باقات الاشتراك',
                backgroundColor: AppColors.primaryDarker,
                faIcon: FontAwesomeIcons.crown,
                isFaicon: true,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutsName.browsecourseView);
                },
              ),
            ],
          ),
        ),
        if (courses.isNotEmpty) ...[
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'الدورات المتاحة',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 320.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              reverse: true, // For RTL feel
              itemCount: courses.length,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              itemBuilder: (context, index) {
                return CourseCard(course: courses[index]);
              },
            ),
          ),
          SizedBox(height: 60.h),
        ],
      ],
    );
  }
}
