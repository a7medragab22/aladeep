
import 'package:aladeep/features/privacy_policy/presentation/widgets/custom_row.dart';
import 'package:aladeep/features/privacy_policy/presentation/widgets/intellectual_content.dart';
import 'package:flutter/material.dart';

class FirstSection extends StatelessWidget {
  const FirstSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomRow(title: "حماية المحتوى الفكري", icon: Icons.shield_outlined),
        const SizedBox(height: 12),
        const Text(
          "جميع المواد التعليمية المقدمة في منصة علاديب محمية بحقوق النشر والتأليف. لا يُسمح بنسخ أو إعادة توزيع أي جزء من المحتوى دون إذن صريح من المدرب.",
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: 16, color: Color(0xff0F2A44)),
        ),
        const SizedBox(height: 16),
        const IntellectualContent(),
        const SizedBox(height: 16),
      ],
    );
  }
}
