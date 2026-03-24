// ─── Course Card ───────────────────────────────────────────────
import 'package:aladeep/features/browse_course_screen/data/course_model/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseCard extends StatelessWidget {
  final CourseModel course;
  const CourseCard({required this.course});

  static const Color primaryGreen = Color(0xFF1B4332);
  static const Color lightGold = Color(0xFFD4AF37);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGrey = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    course.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFFE8F5E9),
                      child: Center(
                        child: Icon(
                          Icons.menu_book_rounded,
                          size: 48.r,
                          color: primaryGreen.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Special offer badge
              if (course.isSpecialOffer)
                Positioned(
                  top: 12.h,
                  right: 12.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDC2626),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      'عرض خاص',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                ),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Instructor
                Row(
                  children: [
                    CircleAvatar(
                      radius: 14.r,
                      backgroundColor: primaryGreen.withOpacity(0.1),
                      child: Text(
                        course.instructorName[2],
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: primaryGreen,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      course.instructorName,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: textGrey,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),

                // Title
                Text(
                  course.title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: textDark,
                    fontFamily: 'Cairo',
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 6.h),

                // Description
                Text(
                  course.description,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: textGrey,
                    fontFamily: 'Cairo',
                    height: 1.5,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 14.h),

                // Duration + Price
                Row(
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      size: 14.r,
                      color: textGrey,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '${course.durationMonths} شهور',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: textGrey,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${course.originalPrice.toInt()} ريال',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: textGrey,
                            decoration: TextDecoration.lineThrough,
                            fontFamily: 'Cairo',
                          ),
                        ),
                        Text(
                          '${course.discountedPrice.toInt()} ريال',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: primaryGreen,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 14.h),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryGreen,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'اشترك في الدورة',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: primaryGreen,
                        side: BorderSide(color: primaryGreen, width: 1.5),
                        padding: EdgeInsets.symmetric(
                          vertical: 12.h,
                          horizontal: 14.w,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        'عينة مجانية',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
