import 'package:aladeep/features/authentication/register/data/register_model/register_model.dart';
import 'package:aladeep/features/authentication/register/data/register_repo/register_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo repo;

  RegisterCubit(this.repo) : super(RegisterInitial());

  RegisterModel? user;

  Future<void> register({
    required String name,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    if (name.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      emit(RegisterFailure("كل الحقول مطلوبة"));
      return;
    }

    if (password != confirmPassword) {
      emit(RegisterFailure("كلمة المرور غير متطابقة"));
      return;
    }

    emit(RegisterLoading());

    try {
      user = await repo.register(name: name, phone: phone, password: password);

      emit(RegisterSuccess(user!.name));
    } catch (e) {
      emit(RegisterFailure("حصل خطأ حاول تاني"));
    }
  }
}
