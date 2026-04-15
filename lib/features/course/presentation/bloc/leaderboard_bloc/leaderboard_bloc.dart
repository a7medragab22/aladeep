import 'package:aladeep/core/bloc/paginated_bloc/exports.dart';
import 'package:aladeep/core/enum/status.dart';
import 'package:aladeep/features/course/data/course_data_source.dart';
import 'package:aladeep/features/course/data/models/leaderboard_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'leaderboard_event.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, BaseState<LeaderboardModel>> {
  final CourseDataSource _courseDataSource;

  LeaderboardBloc(this._courseDataSource) : super(const BaseState()) {
    on<FetchLeaderboard>(_onFetchLeaderboard);
  }

  Future<void> _onFetchLeaderboard(
    FetchLeaderboard event,
    Emitter<BaseState<LeaderboardModel>> emit,
  ) async {
    emit(state.copyWith(status: 
    Status.loading));

    final result = await _courseDataSource.getLeaderboard(event.courseId);

    result.fold(
      (failure) => emit(state.copyWith(
        status: Status.failure,
        errorMessage: failure.message,
      )),
      (leaderboard) => emit(state.copyWith(
        status: Status.success,
        items: leaderboard,
      )),
    );
  }
}
