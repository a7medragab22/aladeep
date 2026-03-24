import 'package:aladeep/core/services/url_launcher_service.dart';
import 'package:aladeep/core/themes/app_color.dart';
import 'package:aladeep/features/home/data/models/footer_link_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterSection extends StatelessWidget {
  final List<FooterLink> quickLinks;
  final Map<IconData, String> socialLinks;

  const FooterSection({
    super.key,
    required this.quickLinks,
    required this.socialLinks,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A1F2E), Color(0xFF0D2A3A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // CTA section
            Container(
              margin: EdgeInsets.all(20.r),
              padding: EdgeInsets.all(28.r),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.primaryGold.withValues(alpha: 0.15),
                    AppColor.primaryGold.withValues(alpha: 0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppColor.primaryGold.withValues(alpha: 0.25),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.rocket_launch_rounded,
                    color: AppColor.primaryGold,
                    size: 36.sp,
                  ),
                  SizedBox(height: 12.h),
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
                  SizedBox(height: 8.h),
                  Text(
                    'لا تضيع المزيد من الوقت في المذاكرة العشوائية، انضم لكتيبة الأديب الآن.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: 12.sp,
                      height: 1.6,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryGold,
                        foregroundColor: AppColor.primaryDark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'تصفح باقات الاشتراك',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Divider
            Divider(color: Colors.white.withValues(alpha: 0.08), height: 1),

            Padding(
              padding: EdgeInsets.all(24.r),
              child: Column(
                children: [
                  // Logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.primaryGold.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColor.primaryGold.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Text(
                          'الأديب',
                          style: TextStyle(
                            color: AppColor.primaryGold,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 14.h),

                  Text(
                    'منصة الأديب التعليمية، خيارك الأول للوصول للدرجة النهائية في اختبارات القدرات اللفظي.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.55),
                      fontSize: 12.sp,
                      height: 1.7,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // Social icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: socialLinks.entries.map((entry) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: InkWell(
                          onTap: () => UrlLauncherService.open(entry.value),
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.15),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              entry.key,
                              color: Colors.white.withValues(alpha: 0.8),
                              size: 18.sp,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 28.h),
                  Divider(color: Colors.white.withValues(alpha: 0.08)),
                  SizedBox(height: 20.h),

                  // Quick links title
                  Text(
                    'روابط سريعة',
                    style: TextStyle(
                      color: AppColor.primaryGold,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // Links
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: quickLinks.map((link) {
                      return InkWell(
                        onTap: () => UrlLauncherService.open(link.url),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.05),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.1),
                            ),
                          ),
                          child: Text(
                            link.title,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.75),
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 24.h),
                  Divider(color: Colors.white.withValues(alpha: 0.08)),
                  SizedBox(height: 16.h),

                  // Support title
                  Text(
                    'الدعم الفني والاشتراكات',
                    style: TextStyle(
                      color: AppColor.primaryGold,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // Phone numbers
                  _PhoneRow(number: '+966 54 009 1992'),
                  SizedBox(height: 8.h),
                  _PhoneRow(number: '+966 51 016 4354'),

                  SizedBox(height: 28.h),
                  Divider(color: Colors.white.withValues(alpha: 0.08)),
                  SizedBox(height: 16.h),

                  // Copyright
                  Text(
                    'جميع الحقوق محفوظة © 2026 | منصة الأديب - أ. صلاح عبد العال',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.35),
                      fontSize: 11.sp,
                      height: 1.6,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'تم التصميم بواسطة ',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.3),
                          fontSize: 11.sp,
                        ),
                      ),
                      Text(
                        'GMTWEB',
                        style: TextStyle(
                          color: AppColor.primaryGold.withValues(alpha: 0.7),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhoneRow extends StatelessWidget {
  final String number;
  const _PhoneRow({required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green, size: 16.sp),
          SizedBox(width: 8.w),
          Text(
            number,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.75),
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
