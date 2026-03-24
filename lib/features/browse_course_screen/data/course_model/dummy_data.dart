import 'package:aladeep/features/browse_course_screen/data/course_model/course_model.dart';

final List<CourseModel> dummyCourses = [
  const CourseModel(
    id: '1',
    title: 'دورة القدرات اللفظي - التأسيس',
    description: 'أقوى دورة لتأسيس مهاراتك اللفظية والوصول للعلامة الكاملة',
    instructorName: 'أ. صلاح عبد العال',
    imageUrl:
        'https://al-adeep.com/uploads/courses/23e15716-951a-437d-9e90-c6a208c84d1c_4.png',
    originalPrice: 40,
    discountedPrice: 25,
    durationMonths: 6,
    isSpecialOffer: true,
  ),
  const CourseModel(
    id: '2',
    title: 'دورة القياس المتقدمة',
    description:
        'للطلاب الذين يريدون الوصول إلى مستوى متقدم في اختبارات القياس',
    instructorName: 'أ. محمد صلاح',
    imageUrl:
        'https://al-adeep.com/uploads/courses/23e15716-951a-437d-9e90-c6a208c84d1c_4.png',
    originalPrice: 30,
    discountedPrice: 22,
    durationMonths: 2,
    isSpecialOffer: true,
  ),
  const CourseModel(
    id: '3',
    title: 'محاكي اختبارات قياس الذكي',
    description:
        'اختبارات عشوائية تسحب من بنك أسئلة ضخم مطابق للاختبار الحقيقي',
    instructorName: 'أ. صلاح عبد العال',
    imageUrl:
        'https://al-adeep.com/uploads/courses/23e15716-951a-437d-9e90-c6a208c84d1c_4.png',
    originalPrice: 60,
    discountedPrice: 45,
    durationMonths: 12,
  ),
];
