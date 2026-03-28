import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/utils/app_drawer.dart';
import 'package:aladeep/core/utils/header.dart';
import 'package:aladeep/features/authentication/register/presentation/widgets/empty_courses_card.dart';
import 'package:aladeep/features/authentication/register/presentation/widgets/header_card.dart';
import 'package:aladeep/features/authentication/register/presentation/widgets/section_title.dart';
import 'package:aladeep/features/home/data/models/footer_link_model.dart';
import 'package:aladeep/features/home/presentation/sections/footer_section.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginResultView extends StatelessWidget {
  const LoginResultView({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F8),
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: Header()),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: HeaderCard(userName: name),
                    ),
                    const SizedBox(height: 24),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: SectionTitle(title: "دوراتي التعليمية"),
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: EmptyCoursesCard(),
                    ),
                  ],
                ),
              ),
            ),
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
