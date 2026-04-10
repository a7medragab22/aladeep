part of "../../auth.dart";

class RegisterEvent extends Equatable {
  final String fullName;
  final String phoneNumber;
  final String password;
  const RegisterEvent({
    required this.fullName,
    required this.phoneNumber,
    required this.password,
  });

  @override
  List<Object?> get props => [fullName, phoneNumber, password];
}