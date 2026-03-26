import 'package:aladeep/features/browse_course_screen/data/course_model/course_model.dart';
import 'package:aladeep/features/browse_course_screen/presentation/widget/header_section.dart';
import 'package:aladeep/features/browse_course_screen/presentation/widget/premium_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/scroll_helper/scroll_helper.dart';
import 'package:aladeep/core/themes/app_color.dart';
import 'package:aladeep/core/utils/app_drawer.dart'; // الـ Drawer الموحد
import 'package:aladeep/core/utils/header.dart'; // الهيدر الموحد
import 'package:aladeep/features/browse_course_screen/presentation/widget/custom_course_card.dart';
import 'package:aladeep/features/home/data/models/footer_link_model.dart';
import 'package:aladeep/features/home/presentation/sections/footer_section.dart'; // الفوتر الموحد
import 'package:flutter/material.dart';

class BrowseCoursesScreen extends StatefulWidget {
  const BrowseCoursesScreen({super.key});

  @override
  State<BrowseCoursesScreen> createState() => _BrowseCoursesScreenState();
}

class _BrowseCoursesScreenState extends State<BrowseCoursesScreen>
    with HomeScrollMixin {
  final List<CourseModel> courses = const [
    CourseModel(
      id: '1',
      title: 'دورة إحتراف Flutter',
      description: 'تعلم بناء تطبيقات احترافية بلغة Dart و Flutter.',
      instructorName: 'ا. محمد صلاح',
      imageUrl:
          'https://images.pexels.com/photos/270404/pexels-photo-270404.jpeg',
      originalPrice: 400.0,
      discountedPrice: 250.0,
      durationMonths: 6,
      isSpecialOffer: true,
      isFeatured: true,
    ),
    CourseModel(
      id: '2',
      title: 'دورة تصميم واجهات UX/UI',
      description: 'أساسيات ونماذج تصميم واجهات المستخدم الحديثة.',
      instructorName: 'ا. أحمد حسن',
      imageUrl:
          'https://images.pexels.com/photos/3184465/pexels-photo-3184465.jpeg',
      originalPrice: 350.0,
      discountedPrice: 210.0,
      durationMonths: 4,
      isSpecialOffer: true,
    ),
    CourseModel(
      id: '3',
      title: 'دورة التسويق الإلكتروني',
      description: 'أساليب التسويق الرقمي وتحسين الوصول للعملاء.',
      instructorName: 'ا. سارة علي',
      imageUrl:
          'https://images.pexels.com/photos/3183115/pexels-photo-3183115.jpeg',
      originalPrice: 300.0,
      discountedPrice: 180.0,
      durationMonths: 3,
      isFeatured: false,
    ),
  ];

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
      backgroundColor: AppColor.bgColor,
      // إضافة الـ Drawer عشان يكون ثابت في كل التطبيق
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            // ── Header الموحد ──
            const SliverToBoxAdapter(child: Header()),

            // ── Featured Package ──
            SliverToBoxAdapter(child: HeaderSection()),

            /// Premium Card
            const SliverToBoxAdapter(child: PremiumCard()),

            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            /// Courses List
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CustomCourseCard(course: courses[index]),
                  ),
                  childCount: courses.length,
                ),
              ),
            ),

            // ── Footer الموحد ──
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
                    Navigator.pushNamed(
                      context,
                      AppRoutsName.aboutInstructorView,
                    );
                  },
                ),
                FooterLink(
                  title: "الدورات",
                  onTap: () {
                    animateTo(0);
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
              ],
              socialLinks: <FaIconData, String>{
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
