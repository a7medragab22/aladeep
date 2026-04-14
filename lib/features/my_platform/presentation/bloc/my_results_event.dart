part of 'my_results_bloc.dart';

abstract class MyResultsEvent extends Equatable {
  const MyResultsEvent();

  @override
  List<Object?> get props => [];
}

class FetchMyResults extends MyResultsEvent {
  final int userId;
  const FetchMyResults(this.userId);

  @override
  List<Object?> get props => [userId];
}
