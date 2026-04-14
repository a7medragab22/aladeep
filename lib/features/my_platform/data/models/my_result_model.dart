import 'package:equatable/equatable.dart';

class MyResultModel extends Equatable {
  final int id;
  final String quizTitle;
  final String courseTitle;
  final double scorePercentage;
  final int correctAnswers;
  final int totalQuestions;
  final bool passed;
  final DateTime dateTaken;
  final bool isFinalExam;

  const MyResultModel({
    required this.id,
    required this.quizTitle,
    required this.courseTitle,
    required this.scorePercentage,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.passed,
    required this.dateTaken,
    required this.isFinalExam,
  });

  factory MyResultModel.fromJson(Map<String, dynamic> json) {
    return MyResultModel(
      id: json['id'] ?? 0,
      quizTitle: json['quizTitle'] ?? '',
      courseTitle: json['courseTitle'] ?? '',
      scorePercentage: (json['scorePercentage'] as num? ?? 0).toDouble(),
      correctAnswers: json['correctAnswers'] ?? 0,
      totalQuestions: json['totalQuestions'] ?? 0,
      passed: json['passed'] ?? false,
      dateTaken: json['dateTaken'] != null 
          ? DateTime.parse(json['dateTaken']) 
          : DateTime.now(),
      isFinalExam: json['isFinalExam'] ?? false,
    );
  }

  @override
  List<Object?> get props => [
        id,
        quizTitle,
        courseTitle,
        scorePercentage,
        correctAnswers,
        totalQuestions,
        passed,
        dateTaken,
        isFinalExam,
      ];
}
