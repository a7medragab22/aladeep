
import 'package:aladeep/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class _FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _FeatureCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      padding: const EdgeInsets.symmetric(vertical: 80),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColor.secondaryColor.withValues(alpha: .2),
            ),
            child: Icon(icon, size: 60.sp, color: AppColor.secondaryColor),
          ),
          SizedBox(height: 16.h),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
              fontSize: 24.sp,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            description,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: TextStyle(color: AppColor.primaryColor, fontSize: 16.sp),
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
        "title": "محاكي قياس الذكي",
        "desc":
            'اختبارات عشوائية تسحب من بنك أسئلة ضخم لتوفير تجربة مطابقة تماماً لاختبار قياس الحقيقي، مع تصحيح فوري.',
        "icon": Icons.psychology,
      },
      {
        "title": "مسار تعليمي متدرج",
        "desc":
            'لن تتجاوز أي خطوة قبل إتقانها! نظامنا المبتكر يجبرك على اجتياز الاختبارات لفتح الدروس التالية لضمان الفهم العميق.',
        "icon": Icons.route,
      },
      {
        "title": 'بيئة آمنة ومركزة',
        "desc":
            'حماية كاملة لحسابك، وتجربة خالية من التشتت الإعلاني مع مشغل فيديوهات مخصص وملازم تفاعلية جاهزة للطباعة.',
        "icon": Icons.privacy_tip,
      },
      {
        "title": 'تواصل مباشر ومستمر',
        "desc":
            'منتدى نقاشات تفاعلي أسفل كل دورة لطرح الأسئلة، بالإضافة إلى بثوث مباشرة مجدولة للمراجعة المباشرة مع المدرب.',
        "icon": Icons.message,
      },
      {
        "title": 'لوحة شرف تنافسية',
        "desc":
            'تنافس مع زملائك وتصدر لوحة الشرف الخاصة بالدورة بناءً على متوسط نتائجك في الاختبارات لزيادة حماسك وشغفك',
        "icon": Icons.gif_box,
      },
      {
        "title": 'شهادات اجتياز معتمدة',
        "desc":
            'احصل على شهادة تفوق فور اجتيازك للاختبار النهائي، توثق مجهودك ونسبة إنجازك في الدورة التدريبية.',

        "icon": Icons.verified,
      },
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final item = features[index];
        return _FeatureCard(
          title: item["title"] as String,
          description: item["desc"] as String,
          icon: item["icon"] as IconData,
        );
      }, childCount: features.length),
    );
  }
}
