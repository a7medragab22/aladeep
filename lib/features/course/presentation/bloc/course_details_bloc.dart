import 'dart:async';
import 'package:aladeep/core/bloc/paginated_bloc/exports.dart';
import 'package:aladeep/core/enum/status.dart';
import 'package:aladeep/features/course/data/course_data_source.dart';
import 'package:aladeep/features/course/data/models/course_details_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'course_details_event.dart';
part 'course_details_state.dart';

class CourseDetailsBloc extends Bloc<CourseDetailsEvent, CourseDetailsState> {
  final CourseDataSource _courseDataSource;

  CourseDetailsBloc(this._courseDataSource) : super(const CourseDetailsState()) {
    on<FetchCourseDetails>(_onFetchCourseDetails);
    on<SelectMaterial>(_onSelectMaterial);
  }

  FutureOr<void> _onFetchCourseDetails(
      FetchCourseDetails event, Emitter<CourseDetailsState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await _courseDataSource.getCourseDetails(event.courseId);
    result.fold(
      (failure) => emit(state.copyWith(
        status: Status.failure,
        errorMessage: failure.message,
      )),
      (course) {
        // Automatically select the first free material if available
        MaterialModel? initialMaterial;
        for (var lesson in course.lessons) {
          for (var mat in lesson.materials) {
            if (mat.isFreeSample == true) {
              initialMaterial = mat;
              break;
            }
          }
          if (initialMaterial != null) break;
        }

        emit(state.copyWith(
          status: Status.success,
          course: course,
          selectedMaterial: initialMaterial,
        ));
      },
    );
  }

  void _onSelectMaterial(SelectMaterial event, Emitter<CourseDetailsState> emit) {
    emit(state.copyWith(selectedMaterial: event.material));
  }
}
