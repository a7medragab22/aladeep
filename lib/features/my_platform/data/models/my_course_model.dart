import 'package:equatable/equatable.dart';

class MyCourseModel extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? imageUrl;
  final DateTime? expiryDate;

  const MyCourseModel({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.expiryDate,
  });

  factory MyCourseModel.fromJson(Map<String, dynamic> json) {
    return MyCourseModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      expiryDate: json['expiryDate'] != null
          ? DateTime.tryParse(json['expiryDate'])
          : null,
    );
  }

  @override
  List<Object?> get props => [id, title, description, imageUrl, expiryDate];
}
