import 'package:aladeep/features/home/domain/entities/comment_entity.dart';

abstract class CommentsRepository {
  Future<List<CommentEntity>> getComments();
}