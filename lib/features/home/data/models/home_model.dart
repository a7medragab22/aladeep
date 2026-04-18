import 'package:equatable/equatable.dart';

class HomeModel extends Equatable {
  final SettingsModel? settings;
  final List<CourseSummaryModel> courses;

  const HomeModel({
    this.settings,
    this.courses = const [],
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> data = json['result'] ?? json;
    return HomeModel(
      settings: data['settings'] != null
          ? SettingsModel.fromJson(data['settings'])
          : null,
      courses: data['courses'] != null
          ? (data['courses'] as List)
              .map((e) => CourseSummaryModel.fromJson(e))
              .toList()
          : [],
    );
  }

  @override
  List<Object?> get props => [settings, courses];
}

class SettingsModel extends Equatable {
  final int? id;
  final String? promoVideoUrl;
  final int? placementTestQuizId;
  final bool? isBundleActive;
  final String? bundleTitle;
  final String? bundleDescription;
  final double? bundlePrice;
  final double? bundleOldPrice;
  final int? bundleDurationMonths;
  final String? trainerBio;

  const SettingsModel({
    this.id,
    this.promoVideoUrl,
    this.placementTestQuizId,
    this.isBundleActive,
    this.bundleTitle,
    this.bundleDescription,
    this.bundlePrice,
    this.bundleOldPrice,
    this.bundleDurationMonths,
    this.trainerBio,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      id: json['id'] as int?,
      promoVideoUrl: json['promoVideoUrl'] as String?,
      placementTestQuizId: json['placementTestQuizId'] as int?,
      isBundleActive: json['isBundleActive'] as bool?,
      bundleTitle: json['bundleTitle'] as String?,
      bundleDescription: json['bundleDescription'] as String?,
      bundlePrice: (json['bundlePrice'] as num?)?.toDouble(),
      bundleOldPrice: (json['bundleOldPrice'] as num?)?.toDouble(),
      bundleDurationMonths: json['bundleDurationMonths'] as int?,
      trainerBio: json['trainerBio'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        id,
        promoVideoUrl,
        placementTestQuizId,
        isBundleActive,
        bundleTitle,
        bundleDescription,
        bundlePrice,
        bundleOldPrice,
        bundleDurationMonths,
        trainerBio
      ];
}

class CourseSummaryModel extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? imageUrl;
  final double? price;
  final double? oldPrice;
  final String? trainerName;
  final DateTime? expiryDate;

  const CourseSummaryModel({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.price,
    this.oldPrice,
    this.trainerName,
    this.expiryDate,
  });

  factory CourseSummaryModel.fromJson(Map<String, dynamic> json) {
    return CourseSummaryModel(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id']?.toString() ?? ''),
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      oldPrice: (json['oldPrice'] as num?)?.toDouble(),
      trainerName: json['trainerName'] as String?,
      expiryDate: json['expiryDate'] != null ? DateTime.tryParse(json['expiryDate']) : null,
    );
  }

  @override
  List<Object?> get props =>
      [id, title, description, imageUrl, price, oldPrice, trainerName, expiryDate];
}
