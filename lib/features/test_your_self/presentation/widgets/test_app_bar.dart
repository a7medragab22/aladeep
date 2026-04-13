import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TestAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String studentName;
  final VoidCallback? onTimeUp;

  const TestAppBar({Key? key, required this.studentName, this.onTimeUp})
    : super(key: key);

  @override
  State<TestAppBar> createState() => _TestAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}

class _TestAppBarState extends State<TestAppBar> {
  int _secondsRemaining = 15 * 60 + 59; // 15:33 for demo
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer?.cancel();
        if (widget.onTimeUp != null) {
          widget.onTimeUp!();
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get timerText {
    int minutes = _secondsRemaining ~/ 60;
    int seconds = _secondsRemaining % 60;
    return '${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF1f8a70), // Match image color
      elevation: 0,
      automaticallyImplyLeading:
          false, // Provide back button or leave it as image? The image has buttons on extreme right? No it shows 'ahmed' and icon.
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.rtl,
        children: [
          // User info
          Row(
            textDirection: TextDirection.rtl,
            children: [
              FaIcon(FontAwesomeIcons.userGraduate, color: Colors.white),
              SizedBox(width: 8.w),
              Text(
                widget.studentName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // Timer
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: const Color(0xFF196e5a), // Darker green
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                const Icon(Icons.access_time, color: Colors.white, size: 20),
                SizedBox(width: 8.w),
                Text(
                  timerText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
