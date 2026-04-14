import 'package:aladeep/core/bloc/paginated_bloc/exports.dart';
import 'package:aladeep/core/enum/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/datasource/my_platform_data_source.dart';
import '../../data/models/my_course_model.dart';

// Events
abstract class MyPlatformEvent extends Equatable {
  const MyPlatformEvent();
  @override
  List<Object> get props => [];
}

class FetchMyCourses extends MyPlatformEvent {
  final int userId;
  const FetchMyCourses(this.userId);
}

// Bloc
class MyPlatformBloc
    extends Bloc<MyPlatformEvent, BaseState<List<MyCourseModel>>> {
  final MyPlatformDataSource _dataSource;

  MyPlatformBloc(this._dataSource) : super(const BaseState()) {
    on<FetchMyCourses>(_onFetchMyCourses);
  }

  Future<void> _onFetchMyCourses(
    FetchMyCourses event,
    Emitter<BaseState<List<MyCourseModel>>> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    final result = await _dataSource.getMyCourses(event.userId);

    result.fold(
      (failure) => emit(
        state.copyWith(status: Status.failure, errorMessage: failure.message),
      ),
      (courses) => emit(state.copyWith(status: Status.success, data: courses)),
    );
  }
}
