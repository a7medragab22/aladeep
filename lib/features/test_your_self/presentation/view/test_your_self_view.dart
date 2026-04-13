import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/test_app_bar.dart';
import '../widgets/test_sidebar.dart';
import '../widgets/test_bottom_bar.dart';
import '../widgets/question_option_tile.dart';

class TestYourSelfView extends StatefulWidget {
  final String studentName;

  const TestYourSelfView({Key? key, this.studentName = 'ahmed'})
    : super(key: key);

  @override
  State<TestYourSelfView> createState() => _TestYourSelfViewState();
}

class _TestYourSelfViewState extends State<TestYourSelfView> {
  int _selectedIndex = -1;
  int _questionNumber = 1;

  final List<String> _letters = ['أ', 'ب', 'ج', 'د'];
  final List<String> _options = ['يع', 'سفخ', 'هعه', 'ئيفي'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Off-white background
      appBar: TestAppBar(
        studentName: widget.studentName,
        onTimeUp: () {
          _submitTest();
        },
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWide =
              constraints.maxWidth > 800; // threshold for web/tablet layout

          return Column(
            children: [
              Expanded(
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    // Sidebar (Only on wide screens)
                    if (isWide) const TestSidebar(),

                    // Main Content
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          textDirection: TextDirection.rtl,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 24.w,
                                vertical: 12.h,
                              ),

                              width: 32.w,
                              height: 32.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                  color: Colors.orangeAccent,
                                  width: 2,
                                ), // Yellow/Orange border
                              ),
                              child: Text(
                                '$_questionNumber',
                                style: TextStyle(
                                  color: AppColors.primaryDarker,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),

                            // Question Titles
                            Container(
                              color: Color(0xff136350),
                              padding: EdgeInsets.all(4),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'قسم الاختبار الحالي', // Example text
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontSize: 12.sp,

                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  Text(
                                    'المفردة الشاذة', // Example text
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Question content goes here
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    // Question Number Badge

                                    // Big Question Target Text
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 24.w,
                                      ),
                                      child: Text(
                                        'يعععيع', // The target word as in the image
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          fontSize: 28.sp,
                                          fontWeight: FontWeight.w900,
                                          color: const Color(0xFF248566),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.h),

                                    // Options List
                                    ...List.generate(_options.length, (index) {
                                      return QuestionOptionTile(
                                        letter: _letters[index],
                                        text: _options[index],
                                        isSelected: _selectedIndex == index,
                                        onTap: () {
                                          setState(() {
                                            _selectedIndex = index;
                                          });
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

              // Bottom Nav Bar
              TestBottomBar(
                onNext: () {
                  // Logic for next
                },
                onPrevious: () {
                  // Logic for previous
                },
                onFinish: () {
                  _submitTest();
                },
              ),
            ],
          );
        },
      ),
    );
  }

  void _submitTest() {
    // For demo purposes, we randomly simulate a score from 0, 60, or 100
    // Currently, let's just show 0 to match screenshot until logic is there.
    final score = _selectedIndex != -1 ? 100 : 0;
    Navigator.pushReplacementNamed(
      context,
      AppRoutsName.testYourSelfResultView,
      arguments: score,
    );
  }
}
