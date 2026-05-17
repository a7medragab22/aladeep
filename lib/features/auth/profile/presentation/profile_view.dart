import 'dart:convert';
import 'package:aladeep/core/bloc/paginated_bloc/exports.dart';
import 'package:aladeep/core/enum/status.dart';
import 'package:aladeep/core/extensions/extensions.dart';
import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils/app_drawer.dart';
import 'package:aladeep/core/helpers/secure_storage_helper.dart';
import 'package:aladeep/core/utils/header.dart';
import 'package:aladeep/core/utils/custom_button.dart';
import 'package:aladeep/core/utils/custom_text_feild.dart';
import 'package:aladeep/features/auth/auth.dart';
import 'package:aladeep/features/auth/models/customer_model.dart';
import 'package:aladeep/features/home/presentation/sections/footer_section.dart';
import 'package:aladeep/features/home/data/models/footer_link_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  final passwordController = TextEditingController();
  CustomerModel? user;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    final userJson = await SecureStorageHelper.getData(key: 'user');
    if (userJson != null) {
      user = CustomerModel.fromJson(jsonDecode(userJson));
      nameController = TextEditingController(text: user?.fullName);
      phoneController = TextEditingController(text: user?.phoneNumber);
      setState(() {});
    } else {
      nameController = TextEditingController();
      phoneController = TextEditingController();
      setState(() {
        user = CustomerModel(); // or handle differently, but user shouldn't be null indefinitely
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: const Color(0xffF5F6F8),
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: Header()),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Container(
                      padding: EdgeInsets.all(24.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryDark.withValues(
                              alpha: 0.05,
                            ),
                            blurRadius: 30,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child:
                          BlocConsumer<
                            ProfileUpdateBloc,
                            BaseState<CustomerModel>
                          >(
                            listener: (context, state) {
                              if (state.status == Status.success) {
                                context.showSuccessMessage(
                                  'تم تحديث الملف الشخصي بنجاح',
                                );
                                // Update local state after success
                                setState(() {
                                  user = state.data;
                                });
                              } else if (state.status == Status.failure) {
                                context.showErrorMessage(
                                  state.errorMessage ?? 'حدث خطأ ما',
                                );
                              }
                            },
                            builder: (context, state) {
                              return Column(
                                children: [
                                  Text(
                                    'تحديث الملف الشخصي',
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryDark,
                                    ),
                                  ),
                                  SizedBox(height: 24.h),
                                  CustomTextField(
                                    label: 'الاسم الثلاثي',
                                    hint: 'أدخل اسمك...',
                                    controller: nameController,
                                    suffixIcon: const Icon(
                                      Icons.person_outline,
                                    ),
                                  ),
                                  CustomTextField(
                                    label: 'رقم الجوال',
                                    hint: '05xxxxxxxx',
                                    controller: phoneController,
                                    suffixIcon: const Icon(Icons.phone_android),
                                  ),
                                  CustomTextField(
                                    label: 'كلمة مرور جديدة (اختياري)',
                                    hint: '••••••••',
                                    controller: passwordController,
                                    isPassword: true,
                                    suffixIcon: const Icon(Icons.lock_outline),
                                  ),
                                  SizedBox(height: 32.h),
                                  CustomButton(
                                    text: 'حفظ التعديلات',
                                    isLoading: state.status == Status.loading,
                                    onPressed: () {
                                      context.read<ProfileUpdateBloc>().add(
                                        ProfileUpdateEvent(
                                          userId: user?.id ?? 0,
                                          fullName: nameController.text,
                                          phoneNumber: phoneController.text,
                                          newPassword:
                                              passwordController.text.isEmpty
                                              ? null
                                              : passwordController.text,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                    ),
                  ],
                ),
              ),
            ),
            FooterSection(
              quickLinks: [
                FooterLink(
                  title: "الرئيسية",
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutsName.homeView),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
