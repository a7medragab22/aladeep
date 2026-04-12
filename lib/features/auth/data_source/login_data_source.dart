part of "../auth.dart";

abstract interface class LoginDataSource {
  Future<Either<Failure, CustomerModel>> login(
    String phoneNumber,
    String password,
  );
}

class LoginDataSourceImpl implements LoginDataSource {
  final GenericDataSource _genericDataSource;
  const LoginDataSourceImpl(this._genericDataSource);

  @override
  Future<Either<Failure, CustomerModel>> login(
    String phoneNumber,
    String password,
  ) {
    return _genericDataSource.postResult(
      endpoint: Endpoints.login,
      data: {"phoneNumber": phoneNumber, "password": password},
      fromJson: (json) => CustomerModel.fromJson(json),
    );
  }
}
