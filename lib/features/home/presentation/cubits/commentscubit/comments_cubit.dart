import 'package:aladeep/features/home/domain/repositories/comments_repository.dart';
import 'package:aladeep/features/home/presentation/cubits/commentscubit/comments_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final CommentsRepository repository;

  CommentsCubit(this.repository) : super(CommentsInitial());

  Future<void> getComments() async {
    emit(CommentsLoading());
    try {
      final comments = await repository.getComments();
      if (!isClosed) {
        emit(CommentsLoaded(comments));
      }
    } catch (e) {
      if (!isClosed) {
        emit(CommentsError(e.toString()));
      }
    }
  }
}
