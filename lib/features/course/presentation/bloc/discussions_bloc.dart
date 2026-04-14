import 'dart:async';
import 'package:aladeep/core/bloc/paginated_bloc/exports.dart';
import 'package:aladeep/core/enum/status.dart';
import 'package:aladeep/features/course/data/course_data_source.dart';
import 'package:aladeep/features/course/data/models/discussion_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';
import 'package:aladeep/core/helpers/cache_helper.dart';

part 'discussions_event.dart';

class DiscussionsBloc extends Bloc<DiscussionsEvent, BaseState<DiscussionModel>> {
  final CourseDataSource _courseDataSource;

  DiscussionsBloc(this._courseDataSource) : super(const BaseState<DiscussionModel>()) {
    on<FetchDiscussions>(_onFetchDiscussions);
    on<AddPost>(_onAddPost);
    on<AddReply>(_onAddReply);
  }

  FutureOr<void> _onFetchDiscussions(
      FetchDiscussions event, Emitter<BaseState<DiscussionModel>> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await _courseDataSource.getForumPosts(event.courseId);
    result.fold(
      (failure) => emit(state.copyWith(
        status: Status.failure,
        errorMessage: failure.message,
      )),
      (discussions) => emit(state.copyWith(
        status: Status.success,
        items: discussions,
      )),
    );
  }

  FutureOr<void> _onAddPost(
      AddPost event, Emitter<BaseState<DiscussionModel>> emit) async {
    final userData = CacheHelper.getData(key: 'user');
    if (userData == null) {
      emit(state.copyWith(status: Status.failure, errorMessage: "User not logged in"));
      return;
    }

    final user = jsonDecode(userData);
    final userId = user['id'];

    emit(state.copyWith(status: Status.loading));
    final result = await _courseDataSource.addForumPost(
      courseId: event.courseId,
      userId: userId,
      content: event.content,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        status: Status.failure,
        errorMessage: failure.message,
      )),
      (message) {
        add(FetchDiscussions(event.courseId));
      },
    );
  }

  FutureOr<void> _onAddReply(
      AddReply event, Emitter<BaseState<DiscussionModel>> emit) async {
    final userData = CacheHelper.getData(key: 'user');
    if (userData == null) {
      emit(state.copyWith(status: Status.failure, errorMessage: "User not logged in"));
      return;
    }

    final user = jsonDecode(userData);
    final userId = user['id'];

    emit(state.copyWith(status: Status.loading));
    final result = await _courseDataSource.addForumReply(
      postId: event.postId,
      userId: userId,
      content: event.content,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        status: Status.failure,
        errorMessage: failure.message,
      )),
      (message) {
        add(FetchDiscussions(event.courseId));
      },
    );
  }
}
