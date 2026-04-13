import 'package:equatable/equatable.dart';

class CourseDetailsModel extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? imageUrl;
  final double? price;
  final double? oldPrice;
  final String? trainerName;
  final String? trainerBio;
  final int? lessonsCount;
  final List<LessonModel> lessons;

  const CourseDetailsModel({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.price,
    this.oldPrice,
    this.trainerName,
    this.trainerBio,
    this.lessonsCount,
    this.lessons = const [],
  });

  factory CourseDetailsModel.fromJson(Map<String, dynamic> json) {
    // The API might return the course object inside a "course" key or directly
    final Map<String, dynamic> data = json['course'] ?? json['result'] ?? json;
    
    return CourseDetailsModel(
      id: data['id'] as int?,
      title: data['title'] as String?,
      description: data['description'] as String?,
      imageUrl: data['imageUrl'] as String?,
      price: (data['price'] as num?)?.toDouble(),
      oldPrice: (data['oldPrice'] as num?)?.toDouble(),
      trainerName: data['trainerName'] as String?,
      trainerBio: data['trainerBio'] as String?,
      lessonsCount: data['lessonsCount'] as int?,
      lessons: data['lessons'] != null
          ? (data['lessons'] as List)
              .map((e) => LessonModel.fromJson(e))
              .toList()
          : [],
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        imageUrl,
        price,
        oldPrice,
        trainerName,
        trainerBio,
        lessonsCount,
        lessons
      ];
}

class LessonModel extends Equatable {
  final int? id;
  final String? title;
  final List<MaterialModel> materials;
  final List<QuizModel> quizzes;

  const LessonModel({
    this.id,
    this.title,
    this.materials = const [],
    this.quizzes = const [],
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      materials: json['materials'] != null
          ? (json['materials'] as List)
              .map((e) => MaterialModel.fromJson(e))
              .toList()
          : [],
      quizzes: json['quizzes'] != null
          ? (json['quizzes'] as List)
              .map((e) => QuizModel.fromJson(e))
              .toList()
          : [],
    );
  }

  @override
  List<Object?> get props => [id, title, materials, quizzes];
}

class MaterialModel extends Equatable {
  final int? id;
  final String? title;
  final String? materialType; // "PDF", "YouTube", etc.
  final bool? isFreeSample;
  final String? url; // This might be needed for the content itself

  const MaterialModel({
    this.id,
    this.title,
    this.materialType,
    this.isFreeSample,
    this.url,
  });

  factory MaterialModel.fromJson(Map<String, dynamic> json) {
    return MaterialModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      materialType: json['materialType'] as String?,
      isFreeSample: json['isFreeSample'] as bool?,
      url: json['url'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, title, materialType, isFreeSample, url];
}

class QuizModel extends Equatable {
  final int? id;
  final String? title;
  final int? durationInMinutes;
  final bool? isFinalExam;

  const QuizModel({
    this.id,
    this.title,
    this.durationInMinutes,
    this.isFinalExam,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      durationInMinutes: json['durationInMinutes'] as int?,
      isFinalExam: json['isFinalExam'] as bool?,
    );
  }

  @override
  List<Object?> get props => [id, title, durationInMinutes, isFinalExam];
}
