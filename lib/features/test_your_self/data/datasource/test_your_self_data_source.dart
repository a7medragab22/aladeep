import 'package:aladeep/core/helpers/helpers.dart';
import '../../../../core/http/either.dart';
import '../../../../core/http/failure.dart';
import '../../../../core/http/http.dart';
import '../models/quiz_model.dart';

abstract class TestYourSelfDataSource {
  Future<Either<Failure, QuizModel>> getQuiz(int quizId);
  Future<Either<Failure, QuizResultModel>> submitQuiz(QuizSubmissionModel submission);
}

class TestYourSelfDataSourceImpl implements TestYourSelfDataSource {
  final GenericDataSource _genericDataSource;

  TestYourSelfDataSourceImpl(this._genericDataSource);

  @override
  Future<Either<Failure, QuizModel>> getQuiz(int quizId) async {
    return await _genericDataSource.fetchFullResponse<QuizModel>(
      endpoint: "${Endpoints.quiz}$quizId",
      fromJson: (json) => QuizModel.fromJson(json),
    );
  }

  @override
  Future<Either<Failure, QuizResultModel>> submitQuiz(
    QuizSubmissionModel submission,
  ) async {
    return await _genericDataSource.postResult<QuizResultModel>(
      endpoint: Endpoints.quizSubmit,
      data: submission.toJson(),
      fromJson: (json) => QuizResultModel.fromJson(json),
    );
  }
}
