import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/scroll_helper/scroll_helper.dart';
import 'package:aladeep/core/services/url_launcher_service.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/features/home/data/models/footer_link_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  final List<FooterLink>? quickLinks;
  final Map<FaIconData, String>? socialLinks;

  const FooterSection({super.key, this.quickLinks, this.socialLinks});

  static Map<FaIconData, String> get defaultSocialLinks => {
    FontAwesomeIcons.telegram: "https://t.me/+ilC41xR1A0xjZjU0",
    FontAwesomeIcons.tiktok:
        "https://www.tiktok.com/@salahabdelaal100?_r=1&_t=ZS-950VqY9n0iX",
    FontAwesomeIcons.youtube:
        "https://youtube.com/@salahabdel-aal6246?si=QNu4FQYF0Oqovw3c",
    FontAwesomeIcons.facebook:
        "https://www.facebook.com/share/18UrxXvobe/?mibextid=wwXIfr",
    FontAwesomeIcons.instagram:
        "https://www.instagram.com/aladib100?igsh=a2RuaXEwazF5bmpk",
  };

  static List<FooterLink> getDefaultQuickLinks(BuildContext context) {
    final scrollProvider = HomeScrollProvider.of(context);

    return [
      FooterLink(
        title: "الرئيسية",
        onTap: () {
          if (scrollProvider != null) {
            scrollProvider.scrollToTop();
          } else {
            Navigator.pushNamed(context, AppRoutsName.homeView);
          }
        },
      ),
      FooterLink(
        title: "عن المدرب",
        onTap: () =>
            Navigator.pushNamed(context, AppRoutsName.aboutInstructorView),
      ),
      FooterLink(
        title: "الدورات",
        onTap: () =>
            Navigator.pushNamed(context, AppRoutsName.browsecourseView),
      ),
      FooterLink(
        title: "آراء الطلاب",
        onTap: () {
          if (scrollProvider != null) {
            scrollProvider.scrollToComments();
          } else {
            Navigator.pushNamed(
              context,
              AppRoutsName.homeView,
              arguments: {'scrollToComments': true},
            );
          }
        },
      ),
      FooterLink(
        title: "سياسة الخصوصية",
        onTap: () =>
            Navigator.pushNamed(context, AppRoutsName.privacyPolicyView),
      ),
    ];
  }

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
            Divider(color: Colors.white.withValues(alpha: 0.08), height: 1),
            Padding(
              padding: EdgeInsets.all(24.r),
              child: Column(
                children: [
                  // Logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),

                        child: Image.asset(
                          'assets/images/logo.jpeg',
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 14.h),

                  Text(
                    'منصة الأديب التعليمية، خيارك الأول للوصول للدرجة النهائية في اختبارات القدرات اللفظي بأحدث الأساليب وتأسيس قوي يضمن لك التفوق.',
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
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
                    children: (socialLinks ?? defaultSocialLinks).entries.map((
                      entry,
                    ) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: InkWell(
                          onTap: () => UrlLauncherService.open(entry.value),
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade800),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: FaIcon(
                              entry.key,
                              color: AppColors.primaryGold,
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
                      color: AppColors.primaryGold,
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
                    children: (quickLinks ?? getDefaultQuickLinks(context)).map(
                      (link) {
                        return InkWell(
                          onTap: link.onTap,
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
                      },
                    ).toList(),
                  ),

                  SizedBox(height: 24.h),
                  Divider(color: Colors.white.withValues(alpha: 0.08)),
                  SizedBox(height: 16.h),

                  // Support title
                  Text(
                    'الدعم الفني والاشتراكات',
                    style: TextStyle(
                      color: AppColors.primaryGold,
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
                          color: AppColors.primaryGold.withValues(alpha: 0.7),
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

  Future<void> _openWhatsApp() async {
    final phone = number.replaceAll(' ', '').replaceAll('+', '');
    final url = Uri.parse('https://wa.me/$phone');

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _openWhatsApp, // 👈 هنا الضغط
      borderRadius: BorderRadius.circular(12),
      child: Container(
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
      ),
    );
  }
}
