import 'package:equatable/equatable.dart';

class DiscussionModel extends Equatable {
  final int id;
  final String userName;
  final String? userRole;
  final String content;
  final String createdAt;
  final List<DiscussionModel> replies;

  const DiscussionModel({
    required this.id,
    required this.userName,
    this.userRole,
    required this.content,
    required this.createdAt,
    this.replies = const [],
  });

  factory DiscussionModel.fromJson(Map<String, dynamic> json) {
    return DiscussionModel(
      id: json['id'] ?? 0,
      userName: json['userName'] ?? '',
      userRole: json['userRole'],
      content: json['content'] ?? '',
      createdAt: json['createdAt'] ?? '',
      replies: (json['replies'] as List? ?? [])
          .map((e) => DiscussionModel.fromJson(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [id, userName, userRole, content, createdAt, replies];

  DiscussionModel copyWith({
    int? id,
    String? userName,
    String? userRole,
    String? content,
    String? createdAt,
    List<DiscussionModel>? replies,
  }) {
    return DiscussionModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      userRole: userRole ?? this.userRole,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      replies: replies ?? this.replies,
    );
  }
}
