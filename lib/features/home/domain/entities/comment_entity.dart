class CommentEntity {
  final String name;
  final String comment;
  final int rating; 
  final int score;
  final String category; // "اللفظي"

  CommentEntity({
    required this.name,
    required this.comment,
    required this.rating,
    required this.score,
    required this.category,
  });
}