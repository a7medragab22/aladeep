import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/scroll_helper/scroll_helper.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils/app_drawer.dart';
import 'package:aladeep/core/utils/custom_button.dart';
import 'package:aladeep/core/utils/header.dart';
import 'package:aladeep/features/auth/login/presentation/widgts/field_label.dart';
import 'package:aladeep/features/auth/login/presentation/widgts/input_field.dart';
import 'package:aladeep/features/home/data/models/footer_link_model.dart';
import 'package:aladeep/features/home/presentation/sections/footer_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with HomeScrollMixin {
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();
  bool _obscurePass = true;

  @override
  void initState() {
    super.initState();
    handleScroll(context);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passController.dispose();
    disposeScroll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. جعل خلفية الـ Scaffold بيضاء تماماً
      backgroundColor: AppColors.white,
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController,
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
                color: AppColors.white, // تأكيد اللون الأبيض هنا أيضاً
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
                child: Column(
                  children: [
                    _buildSmallLogo(),
                    SizedBox(height: 20.h),
                    Text(
                      'مرحباً بعودتك',
                      style: TextStyle(
                        color: AppColors.primaryDark, // نص كحلي واضح
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'قم بتسجيل الدخول لمواصلة رحلة التفوق',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primaryDark.withValues(alpha: 0.6),
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
                FooterLink(
                  title: "الرئيسية",
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutsName.homeView);
                  },
                ),
                FooterLink(
                  title: "عن المدرب",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutsName.aboutInstructorView,
                    );
                  },
                ),
                FooterLink(
                  title: "الدورات",
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutsName.browsecourseView);
                  },
                ),
                FooterLink(
                  title: "آراء الطلاب",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutsName.homeView,
                      arguments: {'scrollToComments': true},
                    );
                  },
                ),
                FooterLink(
                  title: "لماذا نحن",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutsName.homeView,
                      arguments: {'scrollToWhyUs': true},
                    );
                  },
                ),
                FooterLink(
                  title: "سياسة الخصوصية",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutsName.privacyPolicyView,
                    );
                  },
                ),
              ],
              socialLinks: <FaIconData, String>{
                FontAwesomeIcons.telegram: "https://t.me/+ilC41xR1A0xjZjU0",
                FontAwesomeIcons.tiktok:
                    "https://www.tiktok.com/@salahabdelaal100?_r=1&_t=ZS-950VqY9n0iX",
                FontAwesomeIcons.youtube:
                    "https://youtube.com/@salahabdel-aal6246?si=QNu4FQYF0Oqovw3c",
                FontAwesomeIcons.facebook:
                    "https://www.facebook.com/share/18UrxXvobe/?mibextid=wwXIfr",
                FontAwesomeIcons.instagram:
                    "https://www.instagram.com/aladib100?igsh=a2RuaXEwazF5bmpk",
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
            color: AppColors.primaryDark.withValues(alpha: 0.05),
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

          CustomButton(
            text: 'دخول للمنصه',
            backgroundColor: AppColors.primaryDark,
            textColor: AppColors.primaryGold,
            onPressed: () {
              final userName = _phoneController.text.trim().isEmpty
                  ? 'طالب'
                  : _phoneController.text.trim();
              Navigator.pushNamed(
                context,
                AppRoutsName.loginResultView,
                arguments: userName,
              );
            },
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutsName.registerView);
                },
                child: Text(
                  'قم بانشاء حساب الان',
                  style: TextStyle(
                    color: AppColors.primaryGold,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              Text(
                'طالب جديد معنا؟',
                style: TextStyle(color: AppColors.primaryDark, fontSize: 12.sp),
              ),
            ],
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
        color: AppColors.primaryGold.withValues(alpha: 0.1),
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primaryGold.withValues(alpha: 0.2)),
      ),
      child: Center(
        child: Text(
          'أ',
          style: TextStyle(
            color: AppColors.primaryGold,
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
