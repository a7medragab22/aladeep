import 'package:aladeep/core/enum/status.dart';
import 'package:equatable/equatable.dart';

abstract class SubscribeState extends Equatable {
  final Status status;
  final String? message;
  final String? errorMessage;

  const SubscribeState({
    this.status = Status.initial,
    this.message,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, message, errorMessage];
}

class SubscribeInitial extends SubscribeState {
  const SubscribeInitial() : super(status: Status.initial);
}

class SubscribeLoading extends SubscribeState {
  const SubscribeLoading() : super(status: Status.loading);
}

class SubscribeSuccess extends SubscribeState {
  final String successMessage;
  const SubscribeSuccess(this.successMessage)
      : super(status: Status.success, message: successMessage);

  @override
  List<Object?> get props => [status, message, successMessage];
}

class SubscribeFailure extends SubscribeState {
  final String error;
  const SubscribeFailure(this.error)
      : super(status: Status.failure, errorMessage: error);

  @override
  List<Object?> get props => [status, errorMessage, error];
}
