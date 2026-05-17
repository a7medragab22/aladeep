import 'package:flutter/material.dart';

class IntellectualContent extends StatelessWidget {
  const IntellectualContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffFDECEC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: const Text(
        textDirection: TextDirection.rtl,
        "⚠️ يمنع منعًا باتًا تسجيل الفيديوهات، تصوير الشاشات، أو نشر وتداول المذكرات خارج المنصة. أي انتهاك لهذه الحقوق يعرض صاحبه للمساءلة القانونية والإلغاء الفوري للحساب دون استرجاع أي رسوم.",
        style: TextStyle(
          color: Colors.red,
          height: 1.7,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
