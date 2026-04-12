import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils%20copy/custom_text_feild.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        /// Logo
                        // Image.asset(
                        //   "assets/images/logo.png",
                        //   height: 100.h,
                        //   width: 100.w,
                        // ),
                        const SizedBox(height: 25),

                        /// Title
                        Center(
                          child: Text(
                            "مرحباً بعودتك",
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryDark,
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        /// Subtitle
                        const Center(
                          child: Text(
                            "سجل دخولك للمتابعة",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),

                        const SizedBox(height: 25),

                        /// Phone Label
                        const Text(
                          "رقم الهاتف",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0B1A2B),
                          ),
                        ),

                        const SizedBox(height: 8),

                        /// Phone Field
                        CustomTextFeild(
                          hint: "01xxxxxxxxx",
                          controller: phoneController,
                        ),

                        const SizedBox(height: 18),

                        /// Password Label
                        const Text(
                          "كلمة المرور",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryDark,
                          ),
                        ),

                        const SizedBox(height: 8),

                        /// Password
                        CustomTextFeild(
                          hint: "********",
                          controller: passwordController,
                        ),

                        const SizedBox(height: 12),

                        /// Remember + Forgot
                        // Row(
                        //   children: [
                        //     GestureDetector(
                        //       onTap: () {
                        //         Navigator.pushNamed(
                        //           context,
                        //           AppRoutsName.forgetPasswordView,
                        //         );
                        //       },
                        //       child: const Text(
                        //         "نسيت كلمة المرور؟",
                        //         style: TextStyle(
                        //           color: AppColors.primaryDark,
                        //           fontWeight: FontWeight.w500,
                        //         ),
                        //       ),
                        //     ),
                        //     const Spacer(),
                        //     GestureDetector(
                        //       onTap: () {
                        //         setState(() {
                        //           rememberMe = !rememberMe;
                        //         });
                        //       },
                        //       child: Row(
                        //         children: [
                        //           const Text("تذكرني"),
                        //           Checkbox(
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(6),
                        //             ),
                        //             activeColor: AppColors.primaryDark,
                        //             value: rememberMe,
                        //             onChanged: (v) {
                        //               setState(() {
                        //                 rememberMe = v!;
                        //               });
                        //             },
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(height: 15),

                        /// Button
                        // BlocBuilder<LogInCubit, LogInState>(
                        //   builder: (context, state) {
                        //     return CustomButton(
                        //       text: 'دخول',
                        //       icon: Icons.login,
                        //       onPressed: () {
                        //         context.read<LogInCubit>().login(
                        //           phoneController.text,
                        //           passwordController.text,
                        //         );
                        //       },
                        //     );
                        //   },
                        // ),
                        const SizedBox(height: 20),

                        Divider(color: Colors.grey.shade300),

                        const SizedBox(height: 10),

                        /// Register
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutsName.registerView,
                              ),
                              child: Text(
                                "إنشاء حساب جديد",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff0B1A2B),
                                ),
                              ),
                            ),
                            SizedBox(width: 4.h),
                            Text("ليس لديك حساب؟ "),
                          ],
                        ),

                        const SizedBox(height: 12),

                        /// Back
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutsName.homeView,
                              );
                            },
                            child: Text(
                              "← العودة للرئيسية",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
