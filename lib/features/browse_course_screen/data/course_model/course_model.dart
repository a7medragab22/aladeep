// ─── Data Models ───────────────────────────────────────────────
class CourseModel {
  final String id;
  final String title;
  final String description;
  final String instructorName;
  final String imageUrl;
  final double originalPrice;
  final double discountedPrice;
  final int durationMonths;
  final bool isSpecialOffer;
  final bool isFeatured;
  final DateTime? expiryDate;

  const CourseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.instructorName,
    required this.imageUrl,
    required this.originalPrice,
    required this.discountedPrice,
    required this.durationMonths,
    this.isSpecialOffer = false,
    this.isFeatured = false,
    this.expiryDate,
  });
}
