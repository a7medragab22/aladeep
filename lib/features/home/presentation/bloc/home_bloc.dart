import 'dart:async';
import 'package:aladeep/core/bloc/paginated_bloc/exports.dart';
import 'package:aladeep/core/enum/status.dart';
import 'package:aladeep/features/home/data/home_data_source.dart';
import 'package:aladeep/features/home/data/models/home_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, BaseState<HomeModel>> {
  final HomeDataSource _homeDataSource;

  HomeBloc(this._homeDataSource) : super(const BaseState<HomeModel>()) {
    on<FetchHomeData>(_onFetchHomeData);
  }

  FutureOr<void> _onFetchHomeData(
      FetchHomeData event, Emitter<BaseState<HomeModel>> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await _homeDataSource.getHomeData();
    result.fold(
      (failure) => emit(state.copyWith(
        status: Status.failure,
        errorMessage: failure.message,
        failure: failure,
      )),
      (data) => emit(state.copyWith(
        status: Status.success,
        data: data,
      )),
    );
  }
}
