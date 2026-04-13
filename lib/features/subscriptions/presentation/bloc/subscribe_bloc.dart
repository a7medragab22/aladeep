import 'package:aladeep/features/subscriptions/data/datasource/subscription_data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'subscribe_event.dart';
import 'subscribe_state.dart';

class SubscribeBloc extends Bloc<SubscribeEvent, SubscribeState> {
  final SubscriptionDataSource _dataSource;

  SubscribeBloc(this._dataSource) : super(const SubscribeInitial()) {
    on<SubmitSubscription>(_onSubmitSubscription);
    on<SubmitBundleSubscription>(_onSubmitBundleSubscription);
  }

  Future<void> _onSubmitSubscription(
    SubmitSubscription event,
    Emitter<SubscribeState> emit,
  ) async {
    emit(const SubscribeLoading());

    final result = await _dataSource.subscribeToCourse(
      studentId: event.studentId,
      courseId: event.courseId,
      receiptImage: event.receiptImage,
    );

    result.fold(
      (failure) => emit(SubscribeFailure(failure.message)),
      (message) => emit(SubscribeSuccess(message)),
    );
  }

  Future<void> _onSubmitBundleSubscription(
    SubmitBundleSubscription event,
    Emitter<SubscribeState> emit,
  ) async {
    emit(const SubscribeLoading());

    final result = await _dataSource.subscribeToBundle(
      studentId: event.studentId,
      receiptImage: event.receiptImage,
    );

    result.fold(
      (failure) => emit(SubscribeFailure(failure.message)),
      (message) => emit(SubscribeSuccess(message)),
    );
  }
}
