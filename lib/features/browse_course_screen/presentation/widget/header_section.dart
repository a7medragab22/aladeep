import 'package:aladeep/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: const [
          Text(
            "استكشف برامجنا التدريبية",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryDarker,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'باقات متنوعة مصممة خصيصاً لتأسيسك وتدريبك حتى تصل إلى العلامة الكاملة 100% في اختبارات القياس.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColor.primaryDark),
          ),
        ],
      ),
    );
  }
}
