import 'package:aladeep/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccefullStorysSection extends StatelessWidget {
  const SuccefullStorysSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      child: Column(
        children: [
          // Badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Colors.amber.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.amber.withValues(alpha: 0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star_rounded, color: Colors.amber, size: 14.sp),
                SizedBox(width: 6.w),
                Text(
                  'قصص نجاح حقيقية',
                  style: TextStyle(
                    color: Colors.amber.shade700,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16.h),

          Text(
            'قصص نجاح أبطالنا',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDark,
            ),
          ),

          SizedBox(height: 10.h),

          Text(
            'آراء بعض الطلاب الذين حققوا طموحاتهم وتفوقوا في القدرات مع منصة الأديب.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryDark.withValues(alpha: 0.6),
              fontSize: 13.sp,
              height: 1.7,
            ),
          ),

          SizedBox(height: 28.h),

          // Static success stories from website
          _StoryCard(
            name: 'أحمد عبدالله',
            score: '98%',
            category: 'اللفظي',
            comment:
                'منصة رائعة جداً، المحاكي فادني بشكل كبير في كسر رهبة الاختبار الحقيقي، وأسئلة التجميعات بالبنك مطابقة تماماً لما جاءني في قياس الفعلي.',
            initial: 'أ',
            color: Colors.blue.shade900,
          ),
          SizedBox(height: 16.h),
          _StoryCard(
            name: 'سارة محمد',
            score: '100%',
            category: 'اللفظي',
            comment:
                'شرح الأستاذ صلاح لا يعلى عليه، يبسط المعلومة بشكل عجيب. ونظام إجبار الترتيب في الدروس خلاني ألتزم وأذاكر صح.',
            initial: 'س',
            color: Colors.purple.shade900,
          ),
          SizedBox(height: 16.h),
          _StoryCard(
            name: 'خالد فهد',
            score: '97%',
            category: 'اللفظي',
            comment:
                'لوحة الشرف خلتني أتحمس أراجع وأجيب درجات أعلى في الاختبارات عشان أطلع المركز الأول. شكراً لمنصة الأديب على هذا الإبداع!',
            initial: 'خ',
            color: Colors.teal.shade900,
          ),
        ],
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final String name;
  final String score;
  final String category;
  final String comment;
  final String initial;
  final Color color;

  const _StoryCard({
    required this.name,
    required this.score,
    required this.category,
    required this.comment,
    required this.initial,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryDark.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Stars
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.format_quote_rounded,
                size: 32,
                color: Colors.black12,
              ),
              Row(
                children: List.generate(
                  5,
                  (i) => Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                    size: 16.sp,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          Text(
            comment,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 13.sp,
              height: 1.7,
              color: AppColors.primaryDark.withValues(alpha: 0.75),
            ),
          ),

          SizedBox(height: 16.h),
          Divider(color: Colors.grey.shade100),
          SizedBox(height: 12.h),

          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: color,
                child: Text(
                  initial,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(
                        '$score - $category',
                        style: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.trending_up_rounded,
                        color: Colors.green,
                        size: 14.sp,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
