import 'package:aladeep/core/utils/custom_button.dart';
import 'package:aladeep/core/utils/custom_text_feild.dart';
import 'package:aladeep/features/authentication/register/logic/register_cubit/register_cubit.dart';
import 'package:aladeep/features/authentication/register/logic/register_cubit/register_state.dart';
import 'package:aladeep/features/authentication/register/presentation/view/register_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      body: SafeArea(
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RegisterResult(name: state.name),
                ),
              );
            }

            if (state is RegisterFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            final cubit = context.read<RegisterCubit>();

            return Padding(
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
                          suffixIcon: Icon(Icons.person),
                        ),

                        CustomTextField(
                          hint: "05xxxxxxxx",
                          controller: phoneController,
                          label: 'رقم الجوال (للدخول لاحقاً)',
                          suffixIcon: Padding(
                            padding: EdgeInsetsGeometry.all(12),
                            child: FaIcon(FontAwesomeIcons.whatsapp),
                          ),
                        ),

                        CustomTextField(
                          hint: "كلمة المرور",
                          controller: passwordController,
                          isPassword: true,
                          label: 'الاسم الثلاثي المعتمد',
                          suffixIcon: Icon(Icons.person),
                        ),

                        CustomTextField(
                          hint: "تأكيد كلمة المرور",
                          controller: confirmController,
                          isPassword: true,
                          label: 'الاسم الثلاثي المعتمد',
                          suffixIcon: Icon(Icons.person),
                        ),

                        const SizedBox(height: 20),

                        CustomButton(
                          text: "إنشاء الحساب مجاناً",
                          onTap: () {
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
            );
          },
        ),
      ),
    );
  }
}
