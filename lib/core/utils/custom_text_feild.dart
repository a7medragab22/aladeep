import 'package:aladeep/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
final Widget? suffixIcon;
  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
     this.suffixIcon,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        /// 🔹 Label فوق
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColor.primaryColor,
          ),
        ),

        const SizedBox(height: 6),

        /// 🔹 TextField
        TextField(
          controller: widget.controller,

          obscureText: widget.isPassword ? obscure : false,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintTextDirection: TextDirection.rtl,
            hintStyle: TextStyle(color: Colors.grey),

            /// 👇 icon جوه
            suffixIcon: widget.suffixIcon,
            suffixIconColor: Colors.grey,

            /// 👇 eye icon للباسورد
            prefixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      obscure ? Icons.visibility_off : Icons.visibility,
                      size: 16.sp,
                    ),
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                  )
                : null,
            prefixIconColor: Colors.grey  ,
            filled: true,
            fillColor: const Color(0xffF3F4F6),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        const SizedBox(height: 14),
      ],
    );
  }
}
