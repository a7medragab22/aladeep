
import 'package:aladeep/features/privacy_policy/presentation/widgets/custom_row.dart';
import 'package:aladeep/features/privacy_policy/presentation/widgets/payment_content.dart';
import 'package:flutter/material.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 16),
        CustomRow(title: "سياسة الدفع والاشتراك", icon: Icons.attach_money),
        SizedBox(height: 12),
        Text(
          "تقدم منصة علاديب خيارات دفع آمنة ومرنة. يتم تجديد الاشتراكات تلقائيًا ما لم يتم إلغاؤها قبل نهاية فترة الاشتراك الحالية. يرجى مراجعة شروط الخدمة لمزيد من التفاصيل حول سياسة الإلغاء والاسترداد.",
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: 16, color: Color(0xff0F2A44)),
        ),
        SizedBox(height: 16),
        PaymentContent(),
        SizedBox(height: 16),
      ],
    );
  }
}
