import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xff0F2A44),
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xffF1F3F6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Color(0xff0F2A44)),
        ),
      ],
    );
  }
}
