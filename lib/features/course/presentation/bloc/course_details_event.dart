part of 'course_details_bloc.dart';

abstract class CourseDetailsEvent extends Equatable {
  const CourseDetailsEvent();

  @override
  List<Object?> get props => [];
}

class FetchCourseDetails extends CourseDetailsEvent {
  final int courseId;
  const FetchCourseDetails(this.courseId);

  @override
  List<Object?> get props => [courseId];
}

class SelectMaterial extends CourseDetailsEvent {
  final MaterialModel material;
  const SelectMaterial(this.material);

  @override
  List<Object?> get props => [material];
}

class FetchLiveSessions extends CourseDetailsEvent {
  final int courseId;
  const FetchLiveSessions(this.courseId);

  @override
  List<Object?> get props => [courseId];
}

class FetchMaterialUrl extends CourseDetailsEvent {
  final int courseId;
  final int lessonId;
  final MaterialModel material;
  const FetchMaterialUrl({
    required this.courseId,
    required this.lessonId,
    required this.material,
  });
  @override
  List<Object?> get props => [courseId, lessonId, material];
}
