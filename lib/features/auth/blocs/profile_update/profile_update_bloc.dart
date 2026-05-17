part of "../../auth.dart";

class ProfileUpdateBloc
    extends Bloc<ProfileUpdateEvent, BaseState<CustomerModel>> {
  final ProfileUpdateDataSource _profileUpdateDataSource;
  ProfileUpdateBloc(this._profileUpdateDataSource)
    : super(const BaseState<CustomerModel>()) {
    on<ProfileUpdateEvent>(_onUpdateProfile);
  }
  FutureOr<void> _onUpdateProfile(
    ProfileUpdateEvent event,
    Emitter<BaseState<CustomerModel>> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    final result = await _profileUpdateDataSource.updateProfile(
      userId: event.userId,
      fullName: event.fullName,
      phoneNumber: event.phoneNumber,
      newPassword: event.newPassword,
    );
    await result.fold(
      (failure) async => emit(state.copyWith(
          status: Status.failure,
          errorMessage: failure.message,
          failure: failure)),
      (updatedUser) async {
        // Merge with existing user to preserve token and data
        final currentUserJson = await SecureStorageHelper.getData(key: 'user');
        if (currentUserJson != null) {
          final currentUser =
              CustomerModel.fromJson(jsonDecode(currentUserJson));
          final mergedUser = currentUser.copyWith(
            fullName: (updatedUser.fullName != null &&
                    updatedUser.fullName!.isNotEmpty)
                ? updatedUser.fullName
                : event.fullName,
            phoneNumber: (updatedUser.phoneNumber != null &&
                    updatedUser.phoneNumber!.isNotEmpty)
                ? updatedUser.phoneNumber
                : event.phoneNumber,
            token: updatedUser.token ?? currentUser.token,
          );
          await SecureStorageHelper.saveData(
            key: 'user',
            value: jsonEncode(mergedUser.toJson()),
          );
          emit(state.copyWith(status: Status.success, data: mergedUser));
        } else {
          await SecureStorageHelper.saveData(
            key: 'user',
            value: jsonEncode(updatedUser.toJson()),
          );
          emit(state.copyWith(status: Status.success, data: updatedUser));
        }
      },
    );
  }
}
