part of 'course_details_bloc.dart';

class CourseDetailsState extends Equatable {
  final Status status;
  final String? errorMessage;
  final CourseDetailsModel? course;
  final MaterialModel? selectedMaterial;
  final List<LiveSessionModel> liveSessions;
  final Status liveSessionsStatus;
  final Status materialUrlStatus;

  const CourseDetailsState({
    this.status = Status.initial,
    this.errorMessage,
    this.course,
    this.selectedMaterial,
    this.liveSessions = const [],
    this.liveSessionsStatus = Status.initial,
    this.materialUrlStatus = Status.initial,
  });

  CourseDetailsState copyWith({
    Status? status,
    String? errorMessage,
    CourseDetailsModel? course,
    MaterialModel? selectedMaterial,
    List<LiveSessionModel>? liveSessions,
    Status? liveSessionsStatus,
    Status? materialUrlStatus,
  }) {
    return CourseDetailsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      course: course ?? this.course,
      selectedMaterial: selectedMaterial ?? this.selectedMaterial,
      liveSessions: liveSessions ?? this.liveSessions,
      liveSessionsStatus: liveSessionsStatus ?? this.liveSessionsStatus,
      materialUrlStatus: materialUrlStatus ?? this.materialUrlStatus,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        course,
        selectedMaterial,
        liveSessions,
        liveSessionsStatus,
        materialUrlStatus,
      ];
}
