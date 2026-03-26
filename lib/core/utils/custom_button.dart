import 'package:aladeep/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.icon,
    required this.text,
    this.backgroundColor = AppColor.primaryGold,
    this.textColor = Colors.white,
    this.borderColor,
    this.onPressed,
    this.isFaicon = false,
    this.faIcon,
  });
  final IconData? icon;
  final bool isFaicon;
  final FaIconData? faIcon;
  final String text;
  final Color? backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all(
            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          backgroundColor: WidgetStateProperty.all(backgroundColor),
          foregroundColor: WidgetStateProperty.all(textColor),
          elevation: WidgetStateProperty.all(0),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: borderColor != null
                  ? BorderSide(color: borderColor!)
                  : BorderSide.none,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isFaicon ? FaIcon(faIcon) : Icon(icon, size: 18.sp),
            SizedBox(width: 16), // 👈 المسافة اللي انت عايزها
            Text(text, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
