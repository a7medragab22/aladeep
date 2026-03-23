import 'package:aladeep/features/home/domain/entities/comment_entity.dart';

abstract class CommentsState {}

class CommentsInitial extends CommentsState {}

class CommentsLoading extends CommentsState {}

class CommentsLoaded extends CommentsState {
  final List<CommentEntity> comments;

  CommentsLoaded(this.comments);
}

class CommentsError extends CommentsState {
  final String message;

  CommentsError(this.message);
}