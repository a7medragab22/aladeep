import 'package:aladeep/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryDark,
          ),
        ),
        SizedBox(width: 12.w),

        Container(
          padding: EdgeInsets.all(8.w),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[400]!),
          ),
          child: FaIcon(
            FontAwesomeIcons.bookOpen,
            size: 18.sp,
            color: AppColor.primaryDark,
          ),
        ),
      ],
    );
  }
}
