part of "../../auth.dart";

class LoginBloc extends Bloc<LoginEvent, BaseState<CustomerModel>> {
  final LoginDataSource _loginDataSource;
  LoginBloc(this._loginDataSource) : super(const BaseState<CustomerModel>()) {
    on<LoginEvent>(_onLogin);
  }
  FutureOr<void> _onLogin(
    LoginEvent event,
    Emitter<BaseState<CustomerModel>> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    final result = await _loginDataSource.login(
      event.phoneNumber,
      event.password,
    );
    await result.fold(
      (failure) async => emit(
        state.copyWith(
          status: Status.failure,
          errorMessage: failure.message,
          failure: failure,
        ),
      ),
      (user) async {
        await SecureStorageHelper.saveData(key: 'token', value: user.token);
        await SecureStorageHelper.saveData(
          key: 'user',
          value: jsonEncode(user.toJson()),
        );
        emit(state.copyWith(status: Status.success, data: user));
      },
    );
  }
}
