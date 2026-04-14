import 'dart:convert';
import 'package:aladeep/core/bloc/paginated_bloc/exports.dart';
import 'package:aladeep/core/enum/status.dart';
import 'package:aladeep/core/helpers/cache_helper.dart';
import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/features/test_your_self/data/models/quiz_model.dart';
import 'package:aladeep/features/test_your_self/presentation/bloc/quiz_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/test_app_bar.dart';
import '../widgets/test_sidebar.dart';
import '../widgets/test_bottom_bar.dart';
import '../widgets/question_option_tile.dart';

class TestYourSelfView extends StatefulWidget {
  const TestYourSelfView({Key? key}) : super(key: key);

  @override
  State<TestYourSelfView> createState() => _TestYourSelfViewState();
}

class _TestYourSelfViewState extends State<TestYourSelfView> {
  String _getStudentName() {
    final userData = CacheHelper.getData(key: 'user');
    if (userData != null) {
      try {
        final decoded = jsonDecode(userData);
        return decoded['userName'] ?? 'طالب';
      } catch (_) {}
    }
    return 'طالب';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuizBloc, BaseState<QuizModel>>(
      listener: (context, state) {
        if (state.status == Status.success && state.metadata.containsKey('result')) {
          Navigator.pushReplacementNamed(
            context,
            AppRoutsName.testYourSelfResultView,
            arguments: state.metadata['result'],
          );
        }
      },
      child: BlocBuilder<QuizBloc, BaseState<QuizModel>>(
        builder: (context, state) {
          if (state.status == Status.loading && state.data == null) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }

          if (state.status == Status.failure) {
            return Scaffold(
              body: Center(
                child: Text(state.errorMessage ?? 'حدث خطأ ما'),
              ),
            );
          }

          final quiz = state.data;
          if (quiz == null) {
            return const Scaffold(body: Center(child: Text('لا يوجد اختبار حالياً')));
          }

          final currentIndex = state.metadata['currentIndex'] as int? ?? 0;
          final currentQuestion = quiz.questions[currentIndex];
          final answers = state.metadata['answers'] as Map<int, String>? ?? {};
          final selectedOption = answers[currentQuestion.id];

          return Scaffold(
            backgroundColor: const Color(0xFFF8F9FA),
            appBar: TestAppBar(
              studentName: _getStudentName(),
              durationInMinutes: quiz.durationInMinutes,
              onTimeUp: () {
                context.read<QuizBloc>().add(SubmitQuiz());
              },
            ),
            body: LayoutBuilder(
              builder: (context, constraints) {
                bool isWide = constraints.maxWidth > 800;

                return Column(
                  children: [
                    Expanded(
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          if (isWide) const TestSidebar(),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                textDirection: TextDirection.rtl,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildQuestionNumber(currentIndex + 1),
                                  SizedBox(height: 8.h),
                                  _buildQuestionHeader(currentQuestion.skill),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        textDirection: TextDirection.rtl,
                                        children: [
                                          _buildQuestionContent(currentQuestion),
                                          SizedBox(height: 8.h),
                                          ...currentQuestion.options.entries.map((entry) {
                                            return QuestionOptionTile(
                                              letter: entry.key.toUpperCase(),
                                              text: entry.value,
                                              isSelected: selectedOption == entry.key,
                                              onTap: () {
                                                context.read<QuizBloc>().add(UpdateAnswer(
                                                  questionId: currentQuestion.id,
                                                  optionKey: entry.key,
                                                ));
                                              },
                                            );
                                          }),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TestBottomBar(
                      onNext: currentIndex < quiz.questions.length - 1
                          ? () => context.read<QuizBloc>().add(NextQuestion())
                          : null,
                      onPrevious: currentIndex > 0
                          ? () => context.read<QuizBloc>().add(PreviousQuestion())
                          : null,
                      onFinish: () {
                        context.read<QuizBloc>().add(SubmitQuiz());
                      },
                    ),
                    if (state.status == Status.loading)
                      const LinearProgressIndicator(),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildQuestionNumber(int number) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      width: 32.w,
      height: 32.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.orangeAccent, width: 2),
      ),
      child: Text(
        '$number',
        style: TextStyle(
          color: AppColors.primaryDarker,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
      ),
    );
  }

  Widget _buildQuestionHeader(String skill) {
    return Container(
      color: const Color(0xff136350),
      padding: EdgeInsets.all(4.r),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'قسم الاختبار الحالي',
            textDirection: TextDirection.rtl,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade300),
          ),
          SizedBox(height: 12.h),
          Text(
            skill,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionContent(QuestionModel question) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          Text(
            question.text,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w900,
              color: const Color(0xFF248566),
            ),
          ),
          if (question.image != null) ...[
            SizedBox(height: 16.h),
            Image.network(
              question.image!,
              errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
            ),
          ],
        ],
      ),
    );
  }
}
