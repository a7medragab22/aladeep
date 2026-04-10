part of "../../auth.dart";

class LoginBloc extends Bloc<LoginEvent, BaseState<CustomerModel>> {
  final LoginDataSource _loginDataSource;
  LoginBloc(this._loginDataSource) : super(const BaseState<CustomerModel>()) {
    on<LoginEvent>(_onLogin);
  }
  FutureOr<void> _onLogin(
      LoginEvent event, Emitter<BaseState<CustomerModel>> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await _loginDataSource.login(event.phoneNumber, event.password);
    result.fold(
      (failure) => emit(state.copyWith(
          status: Status.failure,
          errorMessage: failure.message,
          failure: failure)),
      (user) {
        CacheHelper.saveData(key: 'token', value: user.token);
        CacheHelper.saveData(key: 'user', value: jsonEncode(user.toJson()));
        emit(state.copyWith(status: Status.success, data: user));
      },
    );
  }
}
