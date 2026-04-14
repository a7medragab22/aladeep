import 'dart:async';
import 'package:aladeep/core/bloc/paginated_bloc/exports.dart';
import 'package:aladeep/core/enum/status.dart';
import 'package:aladeep/core/helpers/cache_helper.dart';
import 'package:aladeep/features/test_your_self/data/datasource/test_your_self_data_source.dart';
import 'package:aladeep/features/test_your_self/data/models/quiz_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';

part 'quiz_event.dart';

class QuizBloc extends Bloc<QuizEvent, BaseState<QuizModel>> {
  final TestYourSelfDataSource _dataSource;

  QuizBloc(this._dataSource) : super(const BaseState<QuizModel>(
    metadata: {
      'currentIndex': 0,
      'answers': <int, String>{}, // questionId -> optionKey
    },
  )) {
    on<FetchQuiz>(_onFetchQuiz);
    on<UpdateAnswer>(_onUpdateAnswer);
    on<NextQuestion>(_onNextQuestion);
    on<PreviousQuestion>(_onPreviousQuestion);
    on<SubmitQuiz>(_onSubmitQuiz);
  }

  FutureOr<void> _onFetchQuiz(FetchQuiz event, Emitter<BaseState<QuizModel>> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await _dataSource.getQuiz(event.quizId);
    result.fold(
      (failure) => emit(state.copyWith(status: Status.failure, errorMessage: failure.message)),
      (quiz) => emit(state.copyWith(status: Status.success, data: quiz)),
    );
  }

  void _onUpdateAnswer(UpdateAnswer event, Emitter<BaseState<QuizModel>> emit) {
    final answers = Map<int, String>.from(state.metadata['answers'] ?? {});
    answers[event.questionId] = event.optionKey;
    
    final newMetadata = Map<String, dynamic>.from(state.metadata);
    newMetadata['answers'] = answers;
    
    emit(state.copyWith(metadata: newMetadata));
  }

  void _onNextQuestion(NextQuestion event, Emitter<BaseState<QuizModel>> emit) {
    final currentIndex = state.metadata['currentIndex'] as int? ?? 0;
    final totalQuestions = state.data?.questions.length ?? 0;
    
    if (currentIndex < totalQuestions - 1) {
      final newMetadata = Map<String, dynamic>.from(state.metadata);
      newMetadata['currentIndex'] = currentIndex + 1;
      emit(state.copyWith(metadata: newMetadata));
    }
  }

  void _onPreviousQuestion(PreviousQuestion event, Emitter<BaseState<QuizModel>> emit) {
    final currentIndex = state.metadata['currentIndex'] as int? ?? 0;
    
    if (currentIndex > 0) {
      final newMetadata = Map<String, dynamic>.from(state.metadata);
      newMetadata['currentIndex'] = currentIndex - 1;
      emit(state.copyWith(metadata: newMetadata));
    }
  }

  FutureOr<void> _onSubmitQuiz(SubmitQuiz event, Emitter<BaseState<QuizModel>> emit) async {
    if (state.data == null) return;

    final userData = CacheHelper.getData(key: 'user');
    int studentId = 27; // Default or fallback
    if (userData != null) {
      try {
        final decoded = jsonDecode(userData);
        studentId = decoded['id'] ?? studentId;
      } catch (_) {}
    }

    final answersMap = state.metadata['answers'] as Map<int, String>? ?? {};
    final stringAnswers = answersMap.map((key, value) => MapEntry(key.toString(), value));

    final submission = QuizSubmissionModel(
      quizId: state.data!.id,
      studentId: studentId,
      answers: stringAnswers,
    );

    emit(state.copyWith(status: Status.loading));
    final result = await _dataSource.submitQuiz(submission);
    
    result.fold(
      (failure) => emit(state.copyWith(status: Status.failure, errorMessage: failure.message)),
      (resultModel) {
        // We can store result in metadata or use a navigation flag
        final newMetadata = Map<String, dynamic>.from(state.metadata);
        newMetadata['result'] = resultModel;
        emit(state.copyWith(status: Status.success, metadata: newMetadata));
      },
    );
  }
}
