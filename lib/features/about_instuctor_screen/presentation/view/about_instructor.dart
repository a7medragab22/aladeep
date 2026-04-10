import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/scroll_helper/scroll_helper.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils/app_drawer.dart';
import 'package:aladeep/core/utils/header.dart';
import 'package:aladeep/features/about_instuctor_screen/presentation/widgets/custom_info_card.dart';
import 'package:aladeep/features/home/data/models/footer_link_model.dart';
import 'package:aladeep/features/home/presentation/sections/footer_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutInstructorScreen extends StatefulWidget {
  const AboutInstructorScreen({super.key});

  @override
  State<AboutInstructorScreen> createState() => _AboutInstructorScreenState();
}

class _AboutInstructorScreenState extends State<AboutInstructorScreen>
    with HomeScrollMixin {
  @override
  void initState() {
    super.initState();
    handleScroll(context);
  }

  @override
  void dispose() {
    disposeScroll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // الموقع غالباً خلفيته بيضاء صريحة
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            const SliverToBoxAdapter(child: Header()),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  /// 🔹 Header Section الجديد
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 30.h,
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 233, 206, 145),
                          Color.fromARGB(255, 251, 234, 201),
                          Color.fromARGB(255, 230, 221, 203),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryGold.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.emoji_events,
                                color: AppColors.primaryGold,
                                size: 16.sp,
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                "ريادة في التدريب",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.primaryGold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 16.h),

                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(fontFamily: 'Cairo'),
                            children: [
                              TextSpan(
                                text: "من هو ",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: AppColors.primaryDarker,
                                ),
                              ),
                              TextSpan(
                                text: "أ. صلاح عبد العال",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryGold,
                                ),
                              ),
                              TextSpan(
                                text: "؟",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: AppColors.primaryDarker,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),

                        /// 🔹 Image Section
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 8.h,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.primaryGold,
                                  width: 2.w,
                                ),
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24.r),
                                child: Image.asset(
                                  "assets/images/instractor.jpeg",
                                  height: 500.h,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            Positioned(
                              right: 16.w,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 10.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 8.r,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "100%",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primaryDarker,
                                          ),
                                        ),
                                        SizedBox(width: 6.w),
                                        Text(
                                          "نسبة نجاح وتفوق",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: AppColors.primaryGold,
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(width: 10.w),
                                    Container(
                                      padding: EdgeInsets.all(8.w),
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryGold,
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.crisis_alert_rounded,
                                        color: Colors.white,
                                        size: 18.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// 🔹 Description
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      padding: EdgeInsets.only(right: 12.w),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: AppColors.primaryGold,
                            width: 3.w,
                          ),
                        ),
                      ),
                      child: Text(
                        'يُعد الأستاذ صلاح عبد العال من أبرز الأسماء والخبراء في مجال تدريب القدرات اللفظي. بفضل سنوات من الخبرة العميقة والتحليل الدقيق لأسئلة (قياس)، قام بتأسيس منصة الأديب لتكون المرجع الأول والأساسي لكل طالب يطمح للوصول إلى الدرجة النهائية بثقة تامة.',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 13.sp,
                          height: 1.6,
                          color: AppColors.primaryDark,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),

                  /// 🔹 Custom Card (Reusable)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 24.h,
                    ),
                    child: CustomInfoCard(
                      title: "خبرة معمقة في قياس",
                      description:
                          'إلمام تفصيلي بكافة تحديثات وأنماط أسئلة المركز الوطني للقياس، مما يضمن لك دراسة ما سيأتيك في الاختبار الفعلي تماماً.',
                      icon: FontAwesomeIcons.bookOpenReader,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 24.h,
                    ),
                    child: CustomInfoCard(
                      title: 'شفرات الحل السريع',
                      description:
                          'ابتكار استراتيجيات ذكية ومبسطة تساعدك على تحليل النصوص واستخراج الإجابة الصحيحة في ثوانٍ معدودة دون تشتت.',
                      icon: FontAwesomeIcons.wandMagicSparkles,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 24.h,
                    ),
                    child: CustomInfoCard(
                      title: 'توجيه واهتمام شخصي',
                      description:
                          'نحن لا نقدم شروحات فقط، بل نتابع تطور مستواك خطوة بخطوة، ونقدم لك الدعم النفسي والتقني حتى يوم اختبارك.',
                      icon: FontAwesomeIcons.userShield,
                    ),
                  ),

                  SizedBox(height: 30.h),
                ],
              ),
            ),
            // 3. الفوتر (ثابت)
            FooterSection(
              quickLinks: [
                FooterLink(
                  title: "الرئيسية",
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutsName.homeView);
                  },
                ),
                FooterLink(
                  title: "عن المدرب",
                  onTap: () {
                    animateTo(0);
                  },
                ),
                FooterLink(
                  title: "الدورات",
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutsName.browsecourseView);
                  },
                ),
                FooterLink(
                  title: "آراء الطلاب",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutsName.homeView,
                      arguments: {'scrollToComments': true},
                    );
                  },
                ),
                FooterLink(
                  title: "لماذا نحن",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutsName.homeView,
                      arguments: {'scrollToWhyUs': true},
                    );
                  },
                ),
                FooterLink(
                  title: "سياسة الخصوصية",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutsName.privacyPolicyView,
                    );
                  },
                ),
              ],
              socialLinks: {
                FontAwesomeIcons.telegram: "https://t.me/+ilC41xR1A0xjZjU0",
                FontAwesomeIcons.tiktok:
                    "https://www.tiktok.com/@salahabdelaal100?_r=1&_t=ZS-950VqY9n0iX",
                FontAwesomeIcons.youtube:
                    "https://youtube.com/@salahabdel-aal6246?si=QNu4FQYF0Oqovw3c",
                FontAwesomeIcons.facebook:
                    "https://www.facebook.com/share/18UrxXvobe/?mibextid=wwXIfr",
                FontAwesomeIcons.instagram:
                    "https://www.instagram.com/aladib100?igsh=a2RuaXEwazF5bmpk",
              },
            ),
          ],
        ),
      ),
    );
  }
}
