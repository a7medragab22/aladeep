import 'package:equatable/equatable.dart';

abstract class LeaderboardEvent extends Equatable {
  const LeaderboardEvent();

  @override
  List<Object?> get props => [];
}

class FetchLeaderboard extends LeaderboardEvent {
  final int courseId;

  const FetchLeaderboard(this.courseId);

  @override
  List<Object?> get props => [courseId];
}
