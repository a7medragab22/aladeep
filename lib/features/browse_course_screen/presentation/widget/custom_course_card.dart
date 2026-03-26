import 'package:aladeep/core/themes/app_color.dart';
import 'package:aladeep/core/utils/custom_button.dart';
import 'package:aladeep/features/browse_course_screen/data/course_model/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCourseCard extends StatelessWidget {
  final CourseModel course;
  const CustomCourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
      padding: const EdgeInsets.all(16),
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
      child: Column(
        children: [
          /// IMAGE + RIBBON + BADGE
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                child: Image.network(
                  course.imageUrl,
                  height: 250.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 250.h,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.image_not_supported, size: 40),
                  ),
                ),
              ),

              /// 🔴 Ribbon (عرض خاص)
              Positioned(
                top: 10,
                left: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
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
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        course.instructorName,
                        style: const TextStyle(color: AppColor.primaryDarker),
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
          ),

          /// CONTENT
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  course.title,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0D2B45),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  course.description,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.grey, fontSize: 16.sp),
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
                          Text(
                            "${course.durationMonths} شهر",
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),

                      /// Price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${course.originalPrice.toStringAsFixed(2)} ريال",
                            style: const TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Text(
                            "${course.discountedPrice.toStringAsFixed(2)}",
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

                /// BUTTON 1
                CustomButton(
                  text: "اشترك في الدورة",
                  backgroundColor: AppColor.primaryDarker,
                  textColor: AppColor.primaryGold,
                  faIcon: FontAwesomeIcons.cartShopping,
                  isFaicon: true,
                ),
                const SizedBox(height: 12),

                /// BUTTON 2
                CustomButton(
                  text: "شاهد العينة المجانية",
                  backgroundColor: Colors.white,
                  textColor: AppColor.primaryDarker,
                  faIcon: FontAwesomeIcons.eye,
                  isFaicon: true,
                  borderColor: AppColor.primaryDarker,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
