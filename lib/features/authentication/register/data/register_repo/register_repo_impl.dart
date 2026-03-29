import 'package:aladeep/features/authentication/register/data/register_model/register_model.dart';

import 'register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  @override
  Future<RegisterModel> register({
    required String name,
    required String phone,
    required String password,
  }) async {
    // 👇 simulate API
    await Future.delayed(const Duration(seconds: 1));

    return RegisterModel(
      name: name,
      phone: phone,
      password: password,
    );
  }
}