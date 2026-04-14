import 'package:aladeep/core/helpers/helpers.dart';
import 'package:aladeep/core/http/http.dart';
import 'package:aladeep/features/course/data/models/discussion_model.dart';
import '../../../../core/http/either.dart';
import '../../../../core/http/failure.dart';
import 'models/course_details_model.dart';

abstract class CourseDataSource {
  Future<Either<Failure, CourseDetailsModel>> getCourseDetails(int courseId);
  Future<Either<Failure, List<DiscussionModel>>> getForumPosts(int courseId);
  Future<Either<Failure, String>> addForumPost({
    required int courseId,
    required int userId,
    required String content,
  });
  Future<Either<Failure, String>> addForumReply({
    required int postId,
    required int userId,
    required String content,
  });
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

  @override
  Future<Either<Failure, List<DiscussionModel>>> getForumPosts(
    int courseId,
  ) async {
    return await _genericDataSource.fetchFullResponse<List<DiscussionModel>>(
      endpoint: "${Endpoints.forum}$courseId",
      fromJson: (json) => (json['posts'] as List)
          .map((e) => DiscussionModel.fromJson(e))
          .toList(),
    );
  }

  @override
  Future<Either<Failure, String>> addForumPost({
    required int courseId,
    required int userId,
    required String content,
  }) async {
    return await _genericDataSource.postResult<String>(
      endpoint: Endpoints.addPost,
      data: {"courseId": courseId, "userId": userId, "content": content},
      fromJson: (json) => json['message'] ?? '',
    );
  }

  @override
  Future<Either<Failure, String>> addForumReply({
    required int postId,
    required int userId,
    required String content,
  }) async {
    return await _genericDataSource.postResult<String>(
      endpoint: Endpoints.addReply,
      data: {"postId": postId, "userId": userId, "content": content},
      fromJson: (json) => json['message'] ?? '',
    );
  }
}
