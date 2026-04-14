import 'package:equatable/equatable.dart';

class QuizModel extends Equatable {
  final int id;
  final String title;
  final int durationInMinutes;
  final bool isFinalExam;
  final List<QuestionModel> questions;

  const QuizModel({
    required this.id,
    required this.title,
    required this.durationInMinutes,
    required this.isFinalExam,
    required this.questions,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    final quizJson = json['quiz'] ?? {};
    return QuizModel(
      id: quizJson['id'] ?? 0,
      title: quizJson['title'] ?? '',
      durationInMinutes: quizJson['durationInMinutes'] ?? 0,
      isFinalExam: quizJson['isFinalExam'] ?? false,
      questions: (json['questions'] as List? ?? [])
          .map((e) => QuestionModel.fromJson(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [id, title, durationInMinutes, isFinalExam, questions];
}

class QuestionModel extends Equatable {
  final int id;
  final String text;
  final String? image;
  final String skill;
  final Map<String, String> options;

  const QuestionModel({
    required this.id,
    required this.text,
    this.image,
    required this.skill,
    required this.options,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'] ?? 0,
      text: json['text'] ?? '',
      image: json['image'],
      skill: json['skill'] ?? '',
      options: Map<String, String>.from(json['options'] ?? {}),
    );
  }

  @override
  List<Object?> get props => [id, text, image, skill, options];
}

class QuizSubmissionModel extends Equatable {
  final int quizId;
  final int studentId;
  final Map<String, String> answers;

  const QuizSubmissionModel({
    required this.quizId,
    required this.studentId,
    required this.answers,
  });

  Map<String, dynamic> toJson() {
    return {
      'QuizId': quizId,
      'StudentId': studentId,
      'Answers': answers,
    };
  }

  @override
  List<Object?> get props => [quizId, studentId, answers];
}

class QuizResultModel extends Equatable {
  final double score;
  final int correctCount;
  final int total;
  final bool passed;
  final bool isFinal;

  const QuizResultModel({
    required this.score,
    required this.correctCount,
    required this.total,
    required this.passed,
    required this.isFinal,
  });

  factory QuizResultModel.fromJson(Map<String, dynamic> json) {
    return QuizResultModel(
      score: (json['score'] as num? ?? 0).toDouble(),
      correctCount: json['correctCount'] ?? 0,
      total: json['total'] ?? 0,
      passed: json['passed'] ?? false,
      isFinal: json['isFinal'] ?? false,
    );
  }

  @override
  List<Object?> get props => [score, correctCount, total, passed, isFinal];
}
