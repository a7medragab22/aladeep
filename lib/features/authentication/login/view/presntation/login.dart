import 'package:aladeep/core/themes/app_color.dart';
import 'package:aladeep/core/utils/app_drawer.dart';
import 'package:aladeep/core/utils/header.dart';
import 'package:aladeep/features/authentication/login/view/widgts/field_label.dart';
import 'package:aladeep/features/authentication/login/view/widgts/input_field.dart';
import 'package:aladeep/features/home/data/models/footer_link_model.dart';
import 'package:aladeep/features/home/presentation/sections/footer_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();
  bool _obscurePass = true;

  @override
  void dispose() {
    _phoneController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. جعل خلفية الـ Scaffold بيضاء تماماً
      backgroundColor: AppColor.white,
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 2. الـ Header (تأكد أن كود ويدجت Header لا يحتوي على خلفية ملونة)
            const SliverToBoxAdapter(
              child: ColoredBox(
                color: Colors.white, // ضمان أن الـ AppBar خلفيته بيضاء
                child: Header(),
              ),
            ),

            // 3. محتوى الصفحة
            SliverToBoxAdapter(
              child: Container(
                constraints: BoxConstraints(minHeight: 0.6.sh),
                color: AppColor.white, // تأكيد اللون الأبيض هنا أيضاً
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
                child: Column(
                  children: [
                    _buildSmallLogo(),
                    SizedBox(height: 20.h),
                    Text(
                      'مرحباً بعودتك',
                      style: TextStyle(
                        color: AppColor.primaryColor, // نص كحلي واضح
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'قم بتسجيل الدخول لمواصلة رحلة التفوق',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColor.primaryColor.withValues(alpha: 0.6),
                        fontSize: 13.sp,
                        height: 1.6,
                      ),
                    ),
                    SizedBox(height: 32.h),

                    // كارت تسجيل الدخول
                    _buildLoginFormCard(),
                  ],
                ),
              ),
            ),

            // 4. الـ Footer (سيبقى في الأسفل)
            FooterSection(
              quickLinks: [
                FooterLink(title: "الرئيسية", url: ""),
                FooterLink(title: "عن المدرب", url: ""),
                FooterLink(title: "الدورات", url: ""),
                FooterLink(title: "آراء الطلاب", url: ""),
                FooterLink(title: "سياسة الخصوصية", url: ""),
              ],
              socialLinks: {
                Icons.telegram: "",
                Icons.tiktok: "",
                Icons.facebook: "",
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginFormCard() {
    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: AppColor.primaryColor.withValues(alpha: 0.05),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const FieldLabel(label: 'رقم الجوال'),
          SizedBox(height: 8.h),
          InputField(
            controller: _phoneController,
            hint: '05xxxxxxxx',
            icon: Icons.phone_android_rounded,
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 18.h),
          const FieldLabel(label: 'كلمة المرور'),
          SizedBox(height: 8.h),
          InputField(
            controller: _passController,
            hint: '••••••••',
            icon: Icons.lock_outline_rounded,
            obscure: _obscurePass,
            suffixIcon: IconButton(
              onPressed: () => setState(() => _obscurePass = !_obscurePass),
              icon: Icon(
                _obscurePass
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: Colors.grey,
                size: 20.sp,
              ),
            ),
          ),
          SizedBox(height: 30.h),

          // زر الدخول باللون البرتقالي/الأصفر (Secondary)
          SizedBox(
            width: double.infinity,
            height: 52.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.secondaryColor,
                foregroundColor: AppColor.primaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'تسجيل الدخول',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallLogo() {
    return Container(
      width: 72.w,
      height: 72.h,
      decoration: BoxDecoration(
        color: AppColor.secondaryColor.withValues(alpha: 0.1),
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColor.secondaryColor.withValues(alpha: 0.2),
        ),
      ),
      child: Center(
        child: Text(
          'أ',
          style: TextStyle(
            color: AppColor.secondaryColor,
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
