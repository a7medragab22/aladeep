import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xffF1E7D0),
          ),
          child: const Text(
            "الشفافية والأمان",
            style: TextStyle(
              color: Color(0xffB38A2E),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 12),
        Text(
          "سياسة الخصوصية",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xff0F2A44),
          ),
        ),
        Text(
          "والشروط",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xffB38A2E),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'نلتزم بحماية بياناتك وتقديم بيئة تعليمية آمنة وموثوقة.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
