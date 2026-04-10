import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils/custom_button.dart';
import 'package:aladeep/features/browse_course_screen/presentation/widget/price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PremiumCard extends StatelessWidget {
  const PremiumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primaryGold,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'الباقة الأوفر والخيّار الذكي',
                  style: TextStyle(
                    color: AppColors.primaryDarker,
                    fontSize: 10.sp,
                  ),
                ),
                SizedBox(width: 8.w),
                FaIcon(
                  FontAwesomeIcons.crown,
                  color: AppColors.primaryDarker,
                  size: 12.sp,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            "البيـب",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),

          const SizedBox(height: 10),

          BenefitRow(
            des: 'اشتراك مفتوح في جميع دورات المنصة\n الحالية والمستقبلية.',
          ),
          BenefitRow(des: 'وصول كامل لبنك الأسئلة والمحاكيات العشوائية.'),
          BenefitRow(des: 'دعم فني ومتابعة شخصية من المدرب.'),

          const SizedBox(height: 20),

          const SizedBox(height: 20),
          Center(
            child: Container(
              width: .5.sw,
              decoration: BoxDecoration(
                color: Color(0xff163754),
                border: Border.all(color: Colors.grey.shade800),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const PriceWidget(price: "100.00", oldPrice: "200.00"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: CustomButton(
                      text: 'اشترك في \n الباقة الآن',
                      backgroundColor: AppColors.primaryGold,
                      textColor: AppColors.primaryDarker,
                      icon: Icons.rocket_launch_outlined,
                    ),
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}

class BenefitRow extends StatelessWidget {
  const BenefitRow({super.key, required this.des});
  final String des;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            des,
            textDirection: TextDirection.rtl,
            style: TextStyle(color: Colors.white, fontSize: 12.sp),
          ),
          SizedBox(width: 10.w),
          FaIcon(
            FontAwesomeIcons.circleCheck,
            size: 12.sp,
            color: AppColors.primaryGold,
          ),
        ],
      ),
    );
  }
}
