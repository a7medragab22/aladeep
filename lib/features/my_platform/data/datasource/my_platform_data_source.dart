import 'package:aladeep/core/helpers/helpers.dart';
import 'package:aladeep/core/http/http.dart';
import 'package:aladeep/core/http/either.dart';
import 'package:aladeep/core/http/failure.dart';
import '../models/my_course_model.dart';

abstract class MyPlatformDataSource {
  Future<Either<Failure, List<MyCourseModel>>> getMyCourses();
}

class MyPlatformDataSourceImpl implements MyPlatformDataSource {
  final GenericDataSource _genericDataSource;

  MyPlatformDataSourceImpl(this._genericDataSource);

  @override
  Future<Either<Failure, List<MyCourseModel>>> getMyCourses() async {
    final result = await _genericDataSource.fetchFullResponse<List<MyCourseModel>>(
      endpoint: Endpoints.myCourses,
      fromJson: (json) {
        final List data = json['myCourses'] ?? [];
        return data.map((e) => MyCourseModel.fromJson(e as Map<String, dynamic>)).toList();
      },
    );
    return result;
  }
}
