import 'package:aladeep/core/themes/app_color.dart';
import 'package:aladeep/core/utils/app_drawer.dart';
import 'package:aladeep/core/utils/header.dart';
import 'package:aladeep/features/home/data/models/footer_link_model.dart';
import 'package:aladeep/features/home/presentation/sections/footer_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutInstructorScreen extends StatelessWidget {
  const AboutInstructorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // الموقع غالباً خلفيته بيضاء صريحة
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: Header()),

              // --- الـ Hero Section (زي الموقع بالظبط) ---
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 40.h,
                    horizontal: 20.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.primaryGreen.withOpacity(
                      0.05,
                    ), // خلفية خضراء باهتة جداً
                  ),
                  child: Column(
                    children: [
                      // صورة المدرب كبيرة وبدون Border دائري تقليدي
                      Container(
                        height: 180.h,
                        width: 180.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.primaryGreen.withOpacity(0.2),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://al-adeep.com/wp-content/uploads/2023/12/instructor-profile.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'الأستاذ محمد الأديب',
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.textDark,
                          fontFamily: 'Cairo',
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.primaryGreen,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          'مؤسس المنصة وخبير اللغة العربية',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // --- محتوى السيرة الذاتية (Bio) ---
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(24.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitleWithLine('نبذة تعريفية'),
                      SizedBox(height: 16.h),
                      Text(
                        'من خلال مسيرة تعليمية حافلة، يسعى الأستاذ محمد الأديب إلى تقديم محتوى تعليمي يجمع بين الأصالة والحداثة. نؤمن في منصة الأديب أن التعليم ليس مجرد تلقين، بل هو بناء فكر وشخصية.',
                        style: TextStyle(
                          fontSize: 16.sp,
                          height: 1.8,
                          color: Colors.black87,
                          fontFamily: 'Cairo',
                        ),
                      ),

                      SizedBox(height: 40.h),

                      _buildTitleWithLine('لماذا تتعلم مع الأديب؟'),
                      SizedBox(height: 20.h),

                      // مميزات على شكل Grid بسيط (زي ستايل الموقع)
                      _buildFeatureItem(
                        Icons.check_circle_outline,
                        'خبرة تزيد عن 10 سنوات في المناهج التعليمية.',
                      ),
                      _buildFeatureItem(
                        Icons.check_circle_outline,
                        'أسلوب مبسط يضمن وصول المعلومة لكل المستويات.',
                      ),
                      _buildFeatureItem(
                        Icons.check_circle_outline,
                        'متابعة دورية واختبارات قياس مستوى مستمرة.',
                      ),
                    ],
                  ),
                ),
              ),

              // 3. الفوتر (ثابت)
              FooterSection(
                quickLinks: const [
                  FooterLink(title: "الرئيسية", url: "https://al-adeep.com"),
                  FooterLink(
                    title: "عن المدرب",
                    url: "https://al-adeep.com/about",
                  ),
                ],
                socialLinks: {
                  Icons.telegram: "https://t.me/your_channel",
                  Icons.facebook: "https://facebook.com",
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleWithLine(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.textDark,
            fontFamily: 'Cairo',
          ),
        ),
        Container(
          width: 60.w,
          height: 4.h,
          margin: EdgeInsets.only(top: 4.h),
          decoration: BoxDecoration(
            color: AppColor.primaryGreen,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Icon(icon, color: AppColor.primaryGreen, size: 24.r),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'Cairo',
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
