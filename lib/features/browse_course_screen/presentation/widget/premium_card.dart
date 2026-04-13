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
    // دالة لجلب البيانات مع التأكد من وجود محتوى دائماً
    List<String> getBenefits() {
      final String? desc = settings?.bundleDescription;
      if (desc == null || desc.trim().isEmpty) {
        return [
          'اشتراك مفتوح في جميع دورات المنصة الحالية والمستقبلية.',
          'وصول كامل لبنك الأسئلة والمحاكيات العشوائية.',
          'دعم فني ومتابعة شخصية من المدرب.',
        ];
      }
      return desc
          .split(RegExp(r'[\n•]'))
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
    }

    final List<String> benefits = getBenefits();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // يبدأ من اليمين في RTL
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isWide) ...[_buildHeaderBadge(), const SizedBox(height: 16)],
          Text(
            settings?.bundleTitle ?? "باقة الأديب",
            style: TextStyle(
              color: Colors.white,
              fontSize: isWide ? 26.sp : 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          // عرض المميزات
          ...benefits.map(
            (benefit) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: FaIcon(
                      FontAwesomeIcons.solidCircleCheck,
                      size: 14.sp,
                      color: AppColors.primaryGold,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      benefit,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
