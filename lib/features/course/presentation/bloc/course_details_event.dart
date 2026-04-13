part of 'course_details_bloc.dart';

abstract class CourseDetailsEvent extends Equatable {
  const CourseDetailsEvent();

  @override
  List<Object> get props => [];
}

class FetchCourseDetails extends CourseDetailsEvent {
  final int courseId;
  const FetchCourseDetails(this.courseId);

  @override
  List<Object> get props => [courseId];
}

class SelectMaterial extends CourseDetailsEvent {
  final MaterialModel material;
  const SelectMaterial(this.material);

  @override
  List<Object> get props => [material];
}
