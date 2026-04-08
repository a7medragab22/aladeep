
import 'package:aladeep/features/privacy_policy/presentation/widgets/custom_row.dart';
import 'package:flutter/material.dart';

class ThirdSection extends StatelessWidget {
  const ThirdSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const CustomRow(title: "سرية بيانات الطلاب", icon: Icons.lock_outline),
        const SizedBox(height: 12),
        Text(
          'نحن في منصة الأديب نلتزم التزاماً كاملاً بحماية خصوصية طلابنا. كافة البيانات المدخلة مشفرة ومحفوظة بسرية تامة على خوادم آمنة، ولن يتم بيعها أو مشاركتها مع أي جهة خارجية. تُستخدم البيانات حصراً لتطوير تجربتك التعليمية بالمنصة.',
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: 16, color: Color(0xff0F2A44)),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
