
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final bool isPrimary;

  const ActionButton({super.key, required this.text, required this.isPrimary});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: isPrimary ? const Color(0xffC8A75D) : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: isPrimary ? null : Border.all(color: Colors.white30),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isPrimary ? Colors.black : Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
