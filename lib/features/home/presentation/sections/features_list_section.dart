import 'package:aladeep/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class _FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final FaIconData icon; // FontAwesome compatible
  final int index;

  const _FeatureCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = index.isOdd;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: isDark ? AppColor.primaryDark : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: isDark
            ? null
            : Border.all(color: AppColor.primaryDark.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: AppColor.primaryDark.withValues(alpha: isDark ? 0.2 : 0.06),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon box
          Container(
            padding: EdgeInsets.all(14.r),
            decoration: BoxDecoration(
              color: AppColor.primaryGold.withValues(
                alpha: isDark ? 0.15 : 0.1,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: FaIcon(icon, size: 28.sp, color: AppColor.primaryGold),
          ),

          SizedBox(width: 16.w),

          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : AppColor.primaryDark,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  description,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.65)
                        : AppColor.primaryDark.withValues(alpha: 0.6),
                    fontSize: 12.sp,
                    height: 1.7,
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

class FeaturesListSection extends StatelessWidget {
  const FeaturesListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      {
        'title': 'محاكي قياس الذكي',
        'desc':
            'اختبارات عشوائية تسحب من بنك أسئلة ضخم لتوفير تجربة مطابقة تماماً لاختبار قياس الحقيقي، مع تصحيح فوري.',
        'icon': FontAwesomeIcons.brain,
      },
      {
        'title': 'مسار تعليمي متدرج',
        'desc':
            'لن تتجاوز أي خطوة قبل إتقانها! نظامنا المبتكر يجبرك على اجتياز الاختبارات لفتح الدروس التالية لضمان الفهم العميق.',
        'icon': FontAwesomeIcons.route,
      },
      {
        'title': 'بيئة آمنة ومركزة',
        'desc':
            'حماية كاملة لحسابك، وتجربة خالية من التشتت الإعلاني مع مشغل فيديوهات مخصص وملازم تفاعلية جاهزة للطباعة.',
        'icon': FontAwesomeIcons.lock,
      },
      {
        'title': 'تواصل مباشر ومستمر',
        'desc':
            'منتدى نقاشات تفاعلي أسفل كل دورة لطرح الأسئلة، بالإضافة إلى بثوث مباشرة مجدولة للمراجعة مع المدرب.',
        'icon': FontAwesomeIcons.comments,
      },
      {
        'title': 'لوحة شرف تنافسية',
        'desc':
            'تنافس مع زملائك وتصدر لوحة الشرف الخاصة بالدورة بناءً على متوسط نتائجك في الاختبارات لزيادة حماسك.',
        'icon': FontAwesomeIcons.trophy,
      },
      {
        'title': 'شهادات اجتياز معتمدة',
        'desc':
            'احصل على شهادة تفوق فور اجتيازك للاختبار النهائي، توثق مجهودك ونسبة إنجازك في الدورة التدريبية.',
        'icon': FontAwesomeIcons.certificate,
      },
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final item = features[index];
        return _FeatureCard(
          title: item['title'] as String,
          description: item['desc'] as String,
          icon: item['icon'] as FaIconData, // FontAwesomeIcons
          index: index,
        );
      }, childCount: features.length),
    );
  }
}
