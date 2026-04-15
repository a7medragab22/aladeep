import 'package:equatable/equatable.dart';

class LeaderboardModel extends Equatable {
  final String? studentName;
  final num? averageScore;
  final int? totalExamsTaken;

  const LeaderboardModel({
    this.studentName,
    this.averageScore,
    this.totalExamsTaken,
  });

  factory LeaderboardModel.fromJson(Map<String, dynamic> json) {
    return LeaderboardModel(
      studentName: json['studentName'] as String?,
      averageScore: json['averageScore'] as num?,
      totalExamsTaken: json['totalExamsTaken'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'studentName': studentName,
      'averageScore': averageScore,
      'totalExamsTaken': totalExamsTaken,
    };
  }

  @override
  List<Object?> get props => [studentName, averageScore, totalExamsTaken];
}
