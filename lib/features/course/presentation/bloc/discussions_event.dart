part of 'discussions_bloc.dart';

abstract class DiscussionsEvent extends Equatable {
  const DiscussionsEvent();

  @override
  List<Object> get props => [];
}

class FetchDiscussions extends DiscussionsEvent {
  final int courseId;
  const FetchDiscussions(this.courseId);

  @override
  List<Object> get props => [courseId];
}

class AddPost extends DiscussionsEvent {
  final int courseId;
  final String content;
  const AddPost({required this.courseId, required this.content});

  @override
  List<Object> get props => [courseId, content];
}

class AddReply extends DiscussionsEvent {
  final int postId;
  final int courseId; // To refresh the list
  final String content;
  const AddReply({required this.postId, required this.courseId, required this.content});

  @override
  List<Object> get props => [postId, courseId, content];
}
