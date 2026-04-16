import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils/custom_button.dart';
import 'package:aladeep/features/browse_course_screen/data/course_model/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:aladeep/features/home/data/models/home_model.dart';

class CustomCourseCard extends StatelessWidget {
  final CourseModel? course;
  final CourseSummaryModel? courseSummary;
  const CustomCourseCard({super.key, this.course, this.courseSummary});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool isWide = constraints.maxWidth > 550;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: _buildContent(context, isWide),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(flex: 2, child: _buildImageSection(isWide)),
                      ],
                    )
                  : Column(
                      children: [
                        _buildImageSection(isWide),
                        _buildContent(context, isWide),
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildImageSection(bool isWide) {
    final img = courseSummary?.imageUrl ?? course?.imageUrl ?? '';
    final isValidImg = img.isNotEmpty;
    final finalImg = isValidImg
        ? (img.startsWith('http') ? img : "https://al-adeep.com$img")
        : '';

    double imageHeight = isWide ? 220.h : 200.h;

    return Stack(
      children: [
        if (isValidImg)
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              finalImg,
              height: imageHeight,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: imageHeight,
                width: double.infinity,
                color: Colors.grey.shade300,
                child: const Icon(Icons.image_not_supported, size: 40),
              ),
            ),
          )
        else
          Container(
            height: imageHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Icon(Icons.image_not_supported, size: 40),
          ),

        /// 🔴 Ribbon (عرض خاص)
        if (courseSummary?.oldPrice != null || course?.isSpecialOffer == true)
          Positioned(
            top: 10,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: const BoxDecoration(
                color: Color(0xFFE53935),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: const Text(
                "عرض خاص",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

        /// 🧑‍🏫 Badge
        Positioned(
          bottom: 10,
          right: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .1),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                Text(
                  courseSummary?.trainerName ?? course?.instructorName ?? '',
                  style: const TextStyle(color: AppColors.primaryDarker),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: const BoxDecoration(
                    color: Color(0xFF123C5A),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: const FaIcon(
                      FontAwesomeIcons.chalkboardUser,
                      color: Color(0xFFC9A54C),
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context, bool isWide) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            courseSummary?.title ?? course?.title ?? '',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: isWide ? 22.sp : 18.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0D2B45),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            courseSummary?.description ?? course?.description ?? '',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey,
              fontSize: isWide ? 14.sp : 12.sp,
            ),
          ),

          const SizedBox(height: 15),

          /// PRICE BOX
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              border: Border.all(
                color: Colors.grey.shade400,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Duration
                Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.clock,
                      size: 18,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 5),
                    if (courseSummary != null || course?.durationMonths != null)
                      Text(
                        "${course?.durationMonths ?? ''} شهر",
                        style: const TextStyle(color: Colors.grey),
                      ),
                  ],
                ),

                /// Price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (courseSummary?.oldPrice != null ||
                        course?.originalPrice != null)
                      Text(
                        "${courseSummary?.oldPrice ?? course?.originalPrice ?? 0} ريال",
                        style: const TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Text(
                      "${courseSummary?.price ?? course?.discountedPrice ?? 0}",
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0D2B45),
                      ),
                    ),
                    const Text(
                      "ريال سعودي",
                      style: TextStyle(
                        color: Color(0xFFC9A54C),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// BUTTONS
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: "اشترك الآن",
                  backgroundColor: AppColors.primaryDarker,
                  textColor: AppColors.primaryGold,
                  faIcon: FontAwesomeIcons.cartShopping,
                  isFaicon: true,
                  onPressed: () {
                    final id =
                        courseSummary?.id ??
                        int.tryParse(course?.id ?? '0') ??
                        0;
                    Navigator.pushNamed(
                      context,
                      AppRoutsName.confirmSubscription,
                      arguments: {
                        'courseId': id,
                        'price':
                            courseSummary?.price ??
                            course?.discountedPrice ??
                            0.0,
                        'isBundle': false,
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: "شاهد العينة",
                  backgroundColor: Colors.white,
                  textColor: AppColors.primaryDarker,
                  faIcon: FontAwesomeIcons.eye,
                  isFaicon: true,
                  borderColor: AppColors.primaryDarker,
                  onPressed: () {
                    final id =
                        courseSummary?.id ??
                        int.tryParse(course?.id ?? '0') ??
                        0;
                    Navigator.pushNamed(
                      context,
                      AppRoutsName.courseDetailsView,
                      arguments: id,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
