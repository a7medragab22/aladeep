import 'package:aladeep/features/authentication/register/data/register_model/register_model.dart';


abstract class RegisterRepo {
  Future<RegisterModel> register({
    required String name,
    required String phone,
    required String password,
  });
}