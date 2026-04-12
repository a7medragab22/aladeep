import 'dart:io';
import 'package:aladeep/core/helpers/helpers.dart';
import 'package:aladeep/core/http/http.dart';
import '../../../../core/http/either.dart';
import '../../../../core/http/failure.dart';

abstract class SubscriptionDataSource {
  Future<Either<Failure, String>> subscribeToCourse({
    required int studentId,
    required int courseId,
    required File receiptImage,
  });

  Future<Either<Failure, String>> subscribeToBundle({
    required int studentId,
    required File receiptImage,
  });
}

class SubscriptionDataSourceImpl implements SubscriptionDataSource {
  final GenericDataSource _genericDataSource;

  SubscriptionDataSourceImpl(this._genericDataSource);

  @override
  Future<Either<Failure, String>> subscribeToCourse({
    required int studentId,
    required int courseId,
    required File receiptImage,
  }) async {
    return await _genericDataSource.postFormData<String>(
      endpoint: Endpoints.subscribe,
      data: {
        'studentId': studentId,
        'courseId': courseId,
        'receiptImage': receiptImage,
      },
    );
  }

  @override
  Future<Either<Failure, String>> subscribeToBundle({
    required int studentId,
    required File receiptImage,
  }) async {
    return await _genericDataSource.postFormData<String>(
      endpoint: Endpoints.subscribeBundle,
      data: {
        'studentId': studentId,
        'receiptImage': receiptImage,
      },
    );
  }
}
