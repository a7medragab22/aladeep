import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils/custom_button.dart';
import 'package:aladeep/features/browse_course_screen/presentation/widget/price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:aladeep/features/home/data/models/home_model.dart';

class PremiumCard extends StatelessWidget {
  final SettingsModel? settings;
  const PremiumCard({super.key, this.settings});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.primaryDark,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool isWide = constraints.maxWidth > 650;

            return Padding(
              padding: EdgeInsets.all(isWide ? 32.r : 20.r),
              child: isWide
                  ? Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: _buildPriceBox(context, isWide),
                        ),
                        const SizedBox(width: 32),
                        Expanded(flex: 3, child: _buildInfoSection(isWide)),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildHeaderBadge(),
                        const SizedBox(height: 16),
                        _buildInfoSection(isWide),
                        const SizedBox(height: 24),
                        _buildPriceBox(context, isWide),
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeaderBadge() {
    return Container(
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
            style: TextStyle(color: AppColors.primaryDarker, fontSize: 10.sp),
          ),
          SizedBox(width: 8.w),
          FaIcon(
            FontAwesomeIcons.crown,
            color: AppColors.primaryDarker,
            size: 12.sp,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(bool isWide) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (isWide) ...[_buildHeaderBadge(), const SizedBox(height: 16)],
        Text(
          settings?.bundleTitle ?? "باقة الأديب",
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: Colors.white,
            fontSize: isWide ? 28.sp : 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        if (settings?.bundleDescription != null)
          BenefitRow(des: settings!.bundleDescription!),
        if (settings?.bundleDescription == null) ...[
          const BenefitRow(
            des: 'اشتراك مفتوح في جميع دورات المنصة الحالية والمستقبلية.',
          ),
          const BenefitRow(des: 'وصول كامل لبنك الأسئلة والمحاكيات العشوائية.'),
          const BenefitRow(des: 'دعم فني ومتابعة شخصية من المدرب.'),
        ],
      ],
    );
  }

  Widget _buildPriceBox(BuildContext context, bool isWide) {
    return Container(
      padding: EdgeInsets.all(isWide ? 24.r : 20.r),
      decoration: BoxDecoration(
        color: const Color(0xff163754),
        border: Border.all(color: Colors.white10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PriceWidget(
            price: (settings?.bundlePrice ?? 100).toString(),
            oldPrice: (settings?.bundleOldPrice ?? 200).toString(),
          ),
          SizedBox(height: isWide ? 20.h : 16.h),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: 'اشترك الآن',
              backgroundColor: AppColors.primaryGold,
              textColor: AppColors.primaryDarker,
              icon: Icons.rocket_launch_outlined,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutsName.confirmSubscription,
                  arguments: {
                    'price': settings?.bundlePrice ?? 100.0,
                    'isBundle': true,
                  },
                );
              },
            ),
          ),
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
          Expanded(
            child: Text(
              des,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white, fontSize: 12.sp),
            ),
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
