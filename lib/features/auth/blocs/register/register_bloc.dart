part of "../../auth.dart";

class RegisterBloc extends Bloc<RegisterEvent, BaseState<CustomerModel>> {
  final RegisterDataSource _registerDataSource;
  RegisterBloc(this._registerDataSource)
    : super(const BaseState<CustomerModel>()) {
    on<RegisterEvent>(_onRegister);
  }
  FutureOr<void> _onRegister(
    RegisterEvent event,
    Emitter<BaseState<CustomerModel>> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    final result = await _registerDataSource.register(
      fullName: event.fullName,
      phoneNumber: event.phoneNumber,
      password: event.password,
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
