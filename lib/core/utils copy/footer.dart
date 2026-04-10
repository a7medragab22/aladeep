import 'package:aladeep/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      color: const Color(0xFF0B1A2B),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          /// LOGO + TEXT
          // const Logo(),
          SizedBox(height: 20.h),
          Text(
            textDirection: TextDirection.rtl,
            "منصتك الأولى لتجارة الجملة في مصر. نربطك\nبأفضل الموردين بأفضل الأسعار.",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              height: 1.6,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 30.h),

          /// LINKS
          _sectionTitle("روابط هامة"),

          _link("من نحن"),
          _divider(),
          _link("بيع معنا"),
          _divider(),
          _link("تواصل معنا"),

          SizedBox(height: 30.h),

          /// HELP
          _sectionTitle("المساعدة"),
          _divider(),
          _link("سياسة الخصوصية"),
          _divider(),
          _link("الأسئلة الشائعة"),
          _divider(),
          _link("الشحن والتوصيل"),
          _divider(),
          _link("الشروط والأحكام"),

          SizedBox(height: 30.h),

          /// BOTTOM
          const Divider(color: Colors.white24),
          SizedBox(height: 10.h),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "DISKA. All Rights Reserved 2026 ©",
                  style: TextStyle(color: Colors.white54, fontSize: 12.sp),
                ),
              ),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Designed and Developed By ",
                    style: TextStyle(color: Colors.white54, fontSize: 12.sp),
                  ),
                  Text(
                    'GMTWEB',
                    style: TextStyle(
                      color: AppColors.bgColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 20.h),

          /// FLOATING BUTTONS
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                _circleButton(FontAwesomeIcons.language, Colors.amber),
                SizedBox(height: 10.h),
                _circleButton(FontAwesomeIcons.whatsapp, Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// SECTION TITLE
  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.bgColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  /// LINK ITEM
  Widget _link(String text, {bool isHighlight = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Text(
        text,
        style: TextStyle(
          color: isHighlight ? AppColors.lightGreen : Colors.white70,
          fontSize: 18.sp,
        ),
      ),
    );
  }

  /// DIVIDER
  Widget _divider() {
    return const Divider(color: Colors.white12, height: 1);
  }

  /// FLOAT BUTTON
  Widget _circleButton(FaIconData icon, Color color) {
    return Container(
      width: 50.w,
      height: 50.w,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: FaIcon(icon, color: Colors.white),
    );
  }
}
