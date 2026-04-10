part of "../auth.dart";

abstract interface class ProfileUpdateDataSource {
  Future<Either<Failure, CustomerModel>> updateProfile({
    required int userId,
    required String fullName,
    required String phoneNumber,
    String? newPassword,
  });
}

class ProfileUpdateDataSourceImpl implements ProfileUpdateDataSource {
  final GenericDataSource _genericDataSource;
  const ProfileUpdateDataSourceImpl(this._genericDataSource);

  @override
  Future<Either<Failure, CustomerModel>> updateProfile({
    required int userId,
    required String fullName,
    required String phoneNumber,
    String? newPassword,
  }) {
    return _genericDataSource.postResult<CustomerModel>(
      endpoint: Endpoints.profileUpdate,
      data: {
        "userId": userId,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        if (newPassword != null) "newPassword": newPassword,
      },
      fromJson: (json) => CustomerModel.fromJson(json),
    );
  }
}
