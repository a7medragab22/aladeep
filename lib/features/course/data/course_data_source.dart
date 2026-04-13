import 'package:aladeep/core/helpers/helpers.dart';
import 'package:aladeep/core/http/http.dart';
import '../../../../core/http/either.dart';
import '../../../../core/http/failure.dart';
import 'models/course_details_model.dart';

abstract class CourseDataSource {
  Future<Either<Failure, CourseDetailsModel>> getCourseDetails(int courseId);
}

class CourseDataSourceImpl implements CourseDataSource {
  final GenericDataSource _genericDataSource;

  CourseDataSourceImpl(this._genericDataSource);

  @override
  Future<Either<Failure, CourseDetailsModel>> getCourseDetails(
    int courseId,
  ) async {
    return await _genericDataSource.fetchFullResponse<CourseDetailsModel>(
      endpoint: "${Endpoints.courseDetails}$courseId",
      fromJson: (json) => CourseDetailsModel.fromJson(json),
    );
  }
}
