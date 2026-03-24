import 'package:aladeep/features/authentication/register/presentation/widgets/empty_courses_card.dart';
import 'package:aladeep/features/authentication/register/presentation/widgets/header_card.dart';
import 'package:aladeep/features/authentication/register/presentation/widgets/section_title.dart';
import 'package:flutter/material.dart';

class RegisterResultView extends StatelessWidget {
  const RegisterResultView({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            /// Header Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: HeaderCard(userName: name),
            ),

            const SizedBox(height: 24),

            /// Section Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SectionTitle(title: "دوراتي التعليمية"),
            ),

            const SizedBox(height: 16),

            /// Empty State
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: EmptyCoursesCard(),
            ),
          ],
        ),
      ),
    );
  }
}
