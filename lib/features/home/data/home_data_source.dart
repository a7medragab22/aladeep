import 'package:aladeep/core/helpers/helpers.dart';
import 'package:aladeep/core/http/http.dart';
import '../../../../core/http/either.dart';
import '../../../../core/http/failure.dart';
import 'models/home_model.dart';

abstract class HomeDataSource {
  Future<Either<Failure, HomeModel>> getHomeData();
}

class HomeDataSourceImpl implements HomeDataSource {
  final GenericDataSource _genericDataSource;

  HomeDataSourceImpl(this._genericDataSource);

  @override
  Future<Either<Failure, HomeModel>> getHomeData() async {
    return await _genericDataSource.fetchFullResponse<HomeModel>(
      endpoint: Endpoints.home,
      fromJson: (json) => HomeModel.fromJson(json),
    );
  }
}
