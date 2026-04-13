import 'package:aladeep/core/bloc/paginated_bloc/exports.dart';
import 'package:aladeep/core/enum/status.dart';
import 'package:aladeep/features/course/data/models/discussion_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscussionsState extends Equatable {
  final Status status;
  final List<DiscussionModel> discussions;
  final String? errorMessage;

  const DiscussionsState({
    this.status = Status.initial,
    this.discussions = const [],
    this.errorMessage,
  });

  DiscussionsState copyWith({
    Status? status,
    List<DiscussionModel>? discussions,
    String? errorMessage,
  }) {
    return DiscussionsState(
      status: status ?? this.status,
      discussions: discussions ?? this.discussions,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, discussions, errorMessage];
}

class DiscussionsCubit extends Cubit<DiscussionsState> {
  DiscussionsCubit() : super(const DiscussionsState());

  void fetchDiscussions(int courseId) async {
    emit(state.copyWith(status: Status.loading));

    // Mocking API call delay
    await Future.delayed(const Duration(seconds: 1));
    if (isClosed) return;

    final mockData = [
      DiscussionModel(
        id: 1,
        userName: 'مؤمن يلا',
        content: 'سيسؤشس',
        createdAt: DateTime.now(),
        replies: [
          DiscussionModel(
            id: 2,
            userName: 'مؤمن يلا',
            content: 'سسسؤشؤ',
            createdAt: DateTime.now(),
          ),
          DiscussionModel(
            id: 3,
            userName: 'مؤمن يلا',
            content: 'سسسؤيشؤؤؤؤ',
            createdAt: DateTime.now(),
          ),
          DiscussionModel(
            id: 4,
            userName: 'مؤمن يلا',
            content: 'ؤ',
            createdAt: DateTime.now(),
          ),
        ],
      ),
    ];

    emit(state.copyWith(status: Status.success, discussions: mockData));
  }

  void postDiscussion(int courseId, String content) async {
    // Add logic here when API is ready
    final newDiscussion = DiscussionModel(
      id: DateTime.now().millisecondsSinceEpoch,
      userName: 'أنت', // Placeholder for current user
      content: content,
      createdAt: DateTime.now(),
    );

    final updated = [newDiscussion, ...state.discussions];
    emit(state.copyWith(discussions: updated));
  }

  void postReply(int discussionId, String content) async {
    // Add logic here when API is ready
    final updated = state.discussions.map((d) {
      if (d.id == discussionId) {
        final newReply = DiscussionModel(
          id: DateTime.now().millisecondsSinceEpoch,
          userName: 'أنت',
          content: content,
          createdAt: DateTime.now(),
        );
        return d.copyWith(replies: [...d.replies, newReply]);
      }
      return d;
    }).toList();

    emit(state.copyWith(discussions: updated));
  }
}
