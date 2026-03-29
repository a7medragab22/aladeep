import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/utils/app_drawer.dart';
import 'package:aladeep/core/utils/header.dart';
import 'package:aladeep/core/utils/custom_button.dart';
import 'package:aladeep/core/utils/custom_text_feild.dart';
import 'package:aladeep/features/authentication/register/logic/register_cubit/register_cubit.dart';
import 'package:aladeep/features/authentication/register/logic/register_cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aladeep/features/home/data/models/footer_link_model.dart';
import 'package:aladeep/features/home/presentation/sections/footer_section.dart';
import '../widgets/register_card.dart';
import '../widgets/register_header.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6F8),
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            print(state);
            if (state is RegisterSuccess) {
              print("SUCCESS 🔥");
              Navigator.pushNamed(
                context,
                AppRoutsName.registerResultView,
                arguments: state.name,
              );
            }

            if (state is RegisterFailure) {
              print("FAIL ❌");
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            final cubit = context.read<RegisterCubit>();

            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: Header()),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        RegisterCard(
                          child: Column(
                            children: [
                              const RegisterHeader(),
                              const SizedBox(height: 20),

                              CustomTextField(
                                hint: "اكتب اسمك هنا",
                                controller: nameController,
                                label: 'الاسم الثلاثي المعتمد',
                                suffixIcon: const Icon(Icons.person),
                              ),

                              CustomTextField(
                                hint: "05xxxxxxxx",
                                controller: phoneController,
                                label: 'رقم الجوال (للدخول لاحقاً)',
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: const FaIcon(
                                    FontAwesomeIcons.whatsapp,
                                  ),
                                ),
                              ),

                              CustomTextField(
                                hint: "كلمة المرور",
                                controller: passwordController,
                                isPassword: true,
                                label: 'الاسم الثلاثي المعتمد',
                                suffixIcon: const Icon(Icons.person),
                              ),

                              CustomTextField(
                                hint: "تأكيد كلمة المرور",
                                controller: confirmController,
                                isPassword: true,
                                label: 'الاسم الثلاثي المعتمد',
                                suffixIcon: const Icon(Icons.person),
                              ),

                              const SizedBox(height: 20),

                              CustomButton(
                                text: "إنشاء الحساب مجاناً",
                                onPressed: () {
                                  print("BUTTON CLICKED 🔥");
                                  cubit.register(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    password: passwordController.text,
                                    confirmPassword: confirmController.text,
                                  );
                                },
                              ),
                            ],
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
                        Navigator.pushNamed(
                          context,
                          AppRoutsName.browsecourseView,
                        );
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
            );
          },
        ),
      ),
    );
  }
}
