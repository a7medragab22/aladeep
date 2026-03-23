import 'package:aladeep/features/home/data/repo/comments_repository_impl.dart';
import 'package:aladeep/features/home/domain/entities/comment_entity.dart';
import 'package:aladeep/features/home/presentation/cubits/commentscubit/comments_cubit.dart';
import 'package:aladeep/features/home/presentation/cubits/commentscubit/comments_state.dart';
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

class CommentCard extends StatelessWidget {
  final CommentEntity comment;

  const CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Header(rating: comment.rating),
          const SizedBox(height: 12),
          _CommentText(text: comment.comment),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 12),
          _Footer(comment: comment),
        ],
      ),
    );
  }
}
class _Header extends StatelessWidget {
  final int rating;

  const _Header({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.format_quote, size: 40, color: Colors.grey),
        Row(
          children: List.generate(
            5,
            (index) => Icon(
              Icons.star,
              color: index < rating ? Colors.amber : Colors.grey.shade300,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
class _CommentText extends StatelessWidget {
  final String text;

  const _CommentText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.right,
      style: const TextStyle(
        fontSize: 16,
        height: 1.6,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final CommentEntity comment;

  const _Footer({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Avatar(name: comment.name),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              comment.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.trending_up, color: Colors.green, size: 16),
                const SizedBox(width: 4),
                Text(
                  "${comment.score}% - ${comment.category}",
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
class _Avatar extends StatelessWidget {
  final String name;

  const _Avatar({required this.name});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.blue.shade900,
      child: Text(
        name[0],
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}