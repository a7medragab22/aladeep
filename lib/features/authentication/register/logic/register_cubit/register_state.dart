abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String name;

  RegisterSuccess(this.name);
}

class RegisterFailure extends RegisterState {
  final String message;

  RegisterFailure(this.message);
}