part of "../auth.dart";

abstract interface class RegisterDataSource {
  Future<Either<Failure, CustomerModel>> register({
    required String fullName,
    required String phoneNumber,
    required String password,
  });
}

class RegisterDataSourceImpl implements RegisterDataSource {
  final GenericDataSource _genericDataSource;
  const RegisterDataSourceImpl(this._genericDataSource);

  @override
  Future<Either<Failure, CustomerModel>> register({
    required String fullName,
    required String phoneNumber,
    required String password,
  }) {
    return _genericDataSource.postResult(
      endpoint: Endpoints.register,
      data: {
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "password": password,
      },
      fromJson: (json) => CustomerModel.fromJson(json),
    );
  }
}
