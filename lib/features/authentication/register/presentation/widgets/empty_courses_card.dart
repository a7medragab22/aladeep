
import 'package:flutter/material.dart';

class EmptyCoursesCard extends StatelessWidget {
  const EmptyCoursesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          const Icon(Icons.inventory_2_outlined, size: 60),

          const SizedBox(height: 16),

          const Text(
            "لا توجد دورات مفعلة بعد",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          const Text(
            "لم تقم بالاشتراك في أي دورة حتى الآن، أو أن طلبك لا يزال قيد المراجعة من الإدارة.",
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xffC8A75D),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              "تصفح الدورات المتاحة الآن",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
