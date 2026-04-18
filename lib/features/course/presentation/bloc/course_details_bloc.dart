import 'dart:async';
import 'package:aladeep/core/enum/status.dart';
import 'package:aladeep/features/course/data/course_data_source.dart';
import 'package:aladeep/features/course/data/models/course_details_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'course_details_event.dart';
part 'course_details_state.dart';

class CourseDetailsBloc extends Bloc<CourseDetailsEvent, CourseDetailsState> {
  final CourseDataSource _courseDataSource;

  CourseDetailsBloc(this._courseDataSource)
    : super(const CourseDetailsState()) {
    on<FetchCourseDetails>(_onFetchCourseDetails);
    on<SelectMaterial>(_onSelectMaterial);
    on<FetchLiveSessions>(_onFetchLiveSessions);
    on<FetchMaterialUrl>(_onFetchMaterialUrl);
  }

  FutureOr<void> _onFetchCourseDetails(
    FetchCourseDetails event,
    Emitter<CourseDetailsState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    // Fetch live sessions in parallel
    add(FetchLiveSessions(event.courseId));

    final result = await _courseDataSource.getCourseDetails(event.courseId);
    result.fold(
      (failure) => emit(
        state.copyWith(status: Status.failure, errorMessage: failure.message),
      ),
      (course) {
        MaterialModel? initialMaterial;
        int? initialLessonId;
        for (var lesson in course.lessons) {
          for (var mat in lesson.materials) {
            if (mat.isFreeSample == true) {
              initialMaterial = mat;
              initialLessonId = lesson.id;
              break;
            }
          }
          if (initialMaterial != null) break;
        }

        emit(
          state.copyWith(
            status: Status.success,
            course: course,
            selectedMaterial: initialMaterial,
          ),
        );

        // Automatically fetch URL for the initial free sample
        if (initialMaterial != null && initialLessonId != null) {
          add(
            FetchMaterialUrl(
              courseId: course.id ?? 0,
              materialId: initialMaterial.id ?? 0,
              material: initialMaterial,
            ),
          );
        }
      },
    );
  }

  FutureOr<void> _onFetchLiveSessions(
    FetchLiveSessions event,
    Emitter<CourseDetailsState> emit,
  ) async {
    emit(state.copyWith(liveSessionsStatus: Status.loading));
    final result = await _courseDataSource.getLiveSessions(event.courseId);
    result.fold(
      (failure) => emit(state.copyWith(liveSessionsStatus: Status.failure)),
      (sessions) => emit(
        state.copyWith(
          liveSessionsStatus: Status.success,
          liveSessions: sessions,
        ),
      ),
    );
  }

  void _onSelectMaterial(
    SelectMaterial event,
    Emitter<CourseDetailsState> emit,
  ) {
    emit(state.copyWith(selectedMaterial: event.material));
  }

  FutureOr<void> _onFetchMaterialUrl(
    FetchMaterialUrl event,
    Emitter<CourseDetailsState> emit,
  ) async {
    emit(
      state.copyWith(
        materialUrlStatus: Status.loading,
        selectedMaterial: event.material,
      ),
    );

    final result = await _courseDataSource.getMaterialUrl(
      event.courseId,
      event.materialId,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          materialUrlStatus: Status.failure,
          errorMessage: failure.message,
        ),
      ),
      (data) {
        final newMaterial = event.material.copyWith(
          url: data['url'] as String?,
          materialType: data['type'] as String?,
        );
        emit(
          state.copyWith(
            materialUrlStatus: Status.success,
            selectedMaterial: newMaterial,
          ),
        );
      },
    );
  }
}
