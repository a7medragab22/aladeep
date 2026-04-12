import 'package:aladeep/core/enum/status.dart';
import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils/app_drawer.dart';
import 'package:aladeep/core/utils/header.dart';
import 'package:aladeep/core/utils/custom_button.dart';
import 'package:aladeep/core/utils/custom_text_feild.dart';
import 'package:aladeep/features/auth/auth.dart';
import 'package:aladeep/features/auth/models/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aladeep/features/home/data/models/footer_link_model.dart';
import 'package:aladeep/features/home/presentation/sections/footer_section.dart';
import 'package:aladeep/core/bloc/paginated_bloc/exports.dart';
import '../widgets/register_card.dart';
import '../widgets/register_header.dart';

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
                    const SizedBox(height: 20),
                    RegisterCard(
                      child:
                          BlocConsumer<RegisterBloc, BaseState<CustomerModel>>(
                            listener: (context, state) {
                          if (state.status == Status.success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('تم إنشاء الحساب بنجاح، قم بتسجيل الدخول'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutsName.loginView,
                            );
                          } else if (state.status == Status.failure) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      state.errorMessage ?? 'حدث خطأ ما',
                                    ),
                                    backgroundColor: AppColors.primaryDark,
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              return Column(
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
                                    suffixIcon: const Padding(
                                      padding: EdgeInsets.all(12),
                                      child: FaIcon(FontAwesomeIcons.whatsapp),
                                    ),
                                  ),
                                  CustomTextField(
                                    hint: "كلمة المرور",
                                    controller: passwordController,
                                    isPassword: true,
                                    label: 'كلمة المرور',
                                    suffixIcon: const Icon(Icons.lock_outline),
                                  ),
                                  CustomTextField(
                                    hint: "تأكيد كلمة المرور",
                                    controller: confirmController,
                                    isPassword: true,
                                    label: 'تأكيد كلمة المرور',
                                    suffixIcon: const Icon(Icons.lock_reset),
                                  ),
                                  const SizedBox(height: 20),
                                  CustomButton(
                                    text: "إنشاء الحساب مجاناً",
                                    isLoading: state.status == Status.loading,
                                    onPressed: () {
                                      if (nameController.text.isEmpty ||
                                          phoneController.text.isEmpty ||
                                          passwordController.text.isEmpty) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'يرجى ملء جميع الحقول',
                                            ),
                                          ),
                                        );
                                        return;
                                      }
                                      if (passwordController.text !=
                                          confirmController.text) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'كلمة المرور غير متطابقة',
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
}
