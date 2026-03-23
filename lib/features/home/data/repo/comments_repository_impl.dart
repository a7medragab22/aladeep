import 'package:aladeep/features/home/domain/entities/comment_entity.dart';
import 'package:aladeep/features/home/domain/repositories/comments_repository.dart';

class CommentsRepositoryImpl implements CommentsRepository {
  @override
  Future<List<CommentEntity>> getComments() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      CommentEntity(
        name: "أحمد عبدالله",
        comment:
            '"منصة رائعة جداً، المحاكي فادني بشكل كبير في كسر رهبة الاختبار الحقيقي."',
        rating: 5,
        score: 98,
        category: "اللفظي",
      ),
      CommentEntity(
        name: "سارة محمد",
        comment: "شرح الأستاذ ممتاز جداً ونظام الترتيب خلاني ألتزم.",
        rating: 5,
        score: 100,
        category: "اللفظي",
      ),
    ];
  }
}
