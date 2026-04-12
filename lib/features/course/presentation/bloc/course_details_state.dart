part of 'course_details_bloc.dart';

class CourseDetailsState extends Equatable {
  final Status status;
  final String? errorMessage;
  final CourseDetailsModel? course;
  final MaterialModel? selectedMaterial;

  const CourseDetailsState({
    this.status = Status.initial,
    this.errorMessage,
    this.course,
    this.selectedMaterial,
  });

  CourseDetailsState copyWith({
    Status? status,
    String? errorMessage,
    CourseDetailsModel? course,
    MaterialModel? selectedMaterial,
  }) {
    return CourseDetailsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      course: course ?? this.course,
      selectedMaterial: selectedMaterial ?? this.selectedMaterial,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, course, selectedMaterial];
}
