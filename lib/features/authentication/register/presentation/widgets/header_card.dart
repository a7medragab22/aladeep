
import 'package:aladeep/features/authentication/register/presentation/widgets/action_button.dart';
import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  final String userName;

  const HeaderCard({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [Color(0xff2E3A59), Color(0xff0D1B2A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Welcome Text
          Text(
            "مرحباً بك،",
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 20,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            userName.isEmpty ? "Ahmed" : userName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            "استكمل رحلة تفوقك واجتاز\nالقدرات اللفظي بنجاح.",
            style: TextStyle(color: Colors.white70),
          ),

          const SizedBox(height: 20),

          /// Buttons
          const ActionButton(text: "استكشاف الدورات", isPrimary: true),

          const SizedBox(height: 12),

          const ActionButton(text: "نتائجي وتقييمي", isPrimary: false),
        ],
      ),
    );
  }
}
