part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object?> get props => [];
}

class FetchQuiz extends QuizEvent {
  final int quizId;
  const FetchQuiz(this.quizId);

  @override
  List<Object?> get props => [quizId];
}

class UpdateAnswer extends QuizEvent {
  final int questionId;
  final String optionKey;
  const UpdateAnswer({required this.questionId, required this.optionKey});

  @override
  List<Object?> get props => [questionId, optionKey];
}

class NextQuestion extends QuizEvent {}

class PreviousQuestion extends QuizEvent {}

class SubmitQuiz extends QuizEvent {}
