import 'package:aladeep/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryDark,
            minimumSize: const Size(double.infinity, 45),
          ),
          onPressed: () {},
          child: const Text("اشترك في الدورة"),
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () {},
          child: const Text("شاهد العينة المجانية"),
        ),
      ],
    );
  }
}
