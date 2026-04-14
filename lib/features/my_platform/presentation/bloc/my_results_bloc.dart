import 'dart:async';
import 'package:aladeep/core/bloc/paginated_bloc/exports.dart';
import 'package:aladeep/core/enum/status.dart';
import 'package:aladeep/features/my_platform/data/datasource/my_platform_data_source.dart';
import 'package:aladeep/features/my_platform/data/models/my_result_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_results_event.dart';

class MyResultsBloc extends Bloc<MyResultsEvent, BaseState<MyResultModel>> {
  final MyPlatformDataSource _dataSource;

  MyResultsBloc(this._dataSource) : super(const BaseState<MyResultModel>()) {
    on<FetchMyResults>(_onFetchMyResults);
  }

  FutureOr<void> _onFetchMyResults(
    FetchMyResults event,
    Emitter<BaseState<MyResultModel>> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    final result = await _dataSource.getMyResults(event.userId);
    result.fold(
      (failure) => emit(
        state.copyWith(status: Status.failure, errorMessage: failure.message),
      ),
      (results) => emit(state.copyWith(status: Status.success, items: results)),
    );
  }
}
