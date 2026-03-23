import 'package:aladeep/features/home/data/repo/comments_repository_impl.dart';
import 'package:aladeep/features/home/presentation/cubits/commentscubit/comments_cubit.dart';
import 'package:aladeep/features/home/presentation/cubits/commentscubit/comments_state.dart';
import 'package:aladeep/features/home/presentation/widgets/comment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CommentsCubit(CommentsRepositoryImpl())..getComments(),
      child: BlocBuilder<CommentsCubit, CommentsState>(
        builder: (context, state) {
          if (state is CommentsLoading) {
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is CommentsError) {
            return SliverToBoxAdapter(
              child: Center(child: Text(state.message)),
            );
          }

          if (state is CommentsLoaded) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return CommentCard(comment: state.comments[index]);
                },
                childCount: state.comments.length,
              ),
            );
          }

          return const SliverToBoxAdapter(child: SizedBox());
        },
      ),
    );
  }
}
