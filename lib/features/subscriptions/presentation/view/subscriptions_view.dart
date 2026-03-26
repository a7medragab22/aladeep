import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aladeep/core/themes/app_color.dart';

class SubscriptionsView extends StatelessWidget {
  const SubscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryDark,
        title: const Text('باقات الاشتراك'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'اختر الباقة المناسبة لك',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryDarker,
              ),
            ),
            SizedBox(height: 16.h),
            Card(
              child: ListTile(
                title: const Text('الباقة الذهبيّة'),
                subtitle: const Text('3 أشهر اشتراك كامل مع دعم مباشر'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: const Text('الباقة الفضّيّة'),
                subtitle: const Text('6 أشهر مع خصم 20%'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: const Text('الباقة الرقميّة'),
                subtitle: const Text('سنتين مع عروض خاصة'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
