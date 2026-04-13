import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class SubscribeEvent extends Equatable {
  const SubscribeEvent();

  @override
  List<Object?> get props => [];
}

class SubmitSubscription extends SubscribeEvent {
  final int studentId;
  final int courseId;
  final File receiptImage;

  const SubmitSubscription({
    required this.studentId,
    required this.courseId,
    required this.receiptImage,
  });

  @override
  List<Object?> get props => [studentId, courseId, receiptImage];
}

class SubmitBundleSubscription extends SubscribeEvent {
  final int studentId;
  final File receiptImage;

  const SubmitBundleSubscription({
    required this.studentId,
    required this.receiptImage,
  });

  @override
  List<Object?> get props => [studentId, receiptImage];
}
