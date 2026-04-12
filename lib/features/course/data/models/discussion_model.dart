import 'package:equatable/equatable.dart';

class DiscussionModel extends Equatable {
  final int id;
  final String userName;
  final String? userAvatar;
  final String content;
  final DateTime createdAt;
  final List<DiscussionModel> replies;

  const DiscussionModel({
    required this.id,
    required this.userName,
    this.userAvatar,
    required this.content,
    required this.createdAt,
    this.replies = const [],
  });

  factory DiscussionModel.fromJson(Map<String, dynamic> json) {
    return DiscussionModel(
      id: json['id'] ?? 0,
      userName: json['user_name'] ?? '',
      userAvatar: json['user_avatar'],
      content: json['content'] ?? '',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      replies: (json['replies'] as List? ?? [])
          .map((e) => DiscussionModel.fromJson(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [id, userName, userAvatar, content, createdAt, replies];

  DiscussionModel copyWith({
    int? id,
    String? userName,
    String? userAvatar,
    String? content,
    DateTime? createdAt,
    List<DiscussionModel>? replies,
  }) {
    return DiscussionModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      userAvatar: userAvatar ?? this.userAvatar,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      replies: replies ?? this.replies,
    );
  }
}
