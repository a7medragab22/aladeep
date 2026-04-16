import 'package:aladeep/core/enum/status.dart';
import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils/app_drawer.dart';
import 'package:aladeep/core/utils/header.dart';
import 'package:aladeep/core/utils/custom_button.dart';
import 'package:aladeep/features/auth/auth.dart';
import 'package:aladeep/features/auth/models/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aladeep/features/home/presentation/sections/footer_section.dart';
import 'package:aladeep/core/bloc/paginated_bloc/exports.dart';
import 'package:aladeep/features/auth/login/presentation/widgts/field_label.dart';
import 'package:aladeep/features/auth/login/presentation/widgts/input_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool _obscurePass = true;
  bool _obscureConfirmPass = true;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      constraints: BoxConstraints(minHeight: 0.6.sh),
                      color: AppColors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 40.h,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/logo.jpeg",
                            height: 100.h,
                            width: 100.w,
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            'إنشاء حساب جديد',
                            style: TextStyle(
                              color: AppColors.primaryDark,
                              fontSize: 26.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'سجل الآن وابدأ رحلة التفوق معنا',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryDark.withValues(
                                alpha: 0.6,
                              ),
                              fontSize: 13.sp,
                              height: 1.6,
                            ),
                          ),
                          SizedBox(height: 32.h),

                          _buildRegisterFormCard(),
                        ],
                      ),
                    ),
                  ),
                  const FooterSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterFormCard() {
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
      child: BlocConsumer<RegisterBloc, BaseState<CustomerModel>>(
        listener: (context, state) {
          if (state.status == Status.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم إنشاء الحساب بنجاح، قم بتسجيل الدخول'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pushReplacementNamed(context, AppRoutsName.loginView);
          } else if (state.status == Status.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage ?? 'حدث خطأ ما',
                  style: TextStyle(color: Colors.white, fontSize: 13.sp),
                ),
                backgroundColor: Colors.red.shade600,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(20.r),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const FieldLabel(label: 'الاسم الثلاثي المعتمد'),
              SizedBox(height: 4.h),
              InputField(
                controller: nameController,
                hint: 'اكتب اسمك هنا',
                icon: Icons.person_outline_rounded,
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 12.h),

              const FieldLabel(label: 'رقم الجوال (للدخول لاحقاً)'),
              SizedBox(height: 4.h),
              InputField(
                controller: phoneController,
                hint: '05xxxxxxxx',
                icon: Icons.phone_android_rounded,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 12.h),

              const FieldLabel(label: 'كلمة المرور'),
              SizedBox(height: 4.h),
              InputField(
                controller: passwordController,
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
              SizedBox(height: 12.h),

              const FieldLabel(label: 'تأكيد كلمة المرور'),
              SizedBox(height: 4.h),
              InputField(
                controller: confirmController,
                hint: '••••••••',
                icon: Icons.lock_reset,
                obscure: _obscureConfirmPass,
                suffixIcon: IconButton(
                  onPressed: () => setState(
                    () => _obscureConfirmPass = !_obscureConfirmPass,
                  ),
                  icon: Icon(
                    _obscureConfirmPass
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.grey,
                    size: 20.sp,
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              CustomButton(
                text: "إنشاء الحساب مجاناً",
                backgroundColor: AppColors.primaryDark,
                textColor: AppColors.primaryGold,
                isLoading: state.status == Status.loading,
                onPressed: () {
                  if (nameController.text.isEmpty ||
                      phoneController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'يرجى ملء جميع الحقول',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                          ),
                        ),
                        backgroundColor: Colors.red.shade600,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(20.r),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    );
                    return;
                  }
                  if (passwordController.text != confirmController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'كلمة المرور غير متطابقة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                          ),
                        ),
                        backgroundColor: Colors.red.shade600,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(20.r),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    );
                    return;
                  }
                  context.read<RegisterBloc>().add(
                    RegisterEvent(
                      fullName: nameController.text,
                      phoneNumber: phoneController.text,
                      password: passwordController.text,
                    ),
                  );
                },
              ),
              SizedBox(height: 16.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutsName.loginView,
                      );
                    },
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        color: AppColors.primaryGold,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  Text(
                    'لديك حساب بالفعل ؟',
                    style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
