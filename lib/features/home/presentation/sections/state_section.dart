import 'package:aladeep/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        children: [
          _StatItem(number: "10004+", label: "طالب وطالبة يثقون بنا"),
          SizedBox(height: 30),
          _StatItem(number: "100%", label: "نسبة رضا وتفوق الطلاب"),
          SizedBox(height: 30),
          _StatItem(number: "2+", label: "برامج تدريب متخصصة"),
          SizedBox(height: 30),
          _StatItem(number: "24/7", label: "دعم فني وتواصل مستمر"),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String number;
  final String label;

  const _StatItem({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: AppColor.secondaryColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
