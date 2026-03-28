import 'package:aladeep/features/privacy_policy/presentation/widgets/bullet.dart';
import 'package:flutter/material.dart';

class PaymentContent extends StatelessWidget {
  const PaymentContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        SizedBox(height: 10),
        Bullet(text: "المبالغ المدفوعة غير قابلة للاسترداد بعد التفعيل."),
        Bullet(text: "الاشتراك شخصي ولا يجوز مشاركة بيانات الدخول."),
        Bullet(text: "استخدام الحساب من أكثر من شخص يؤدي للحظر."),
      ],
    );
  }
}
