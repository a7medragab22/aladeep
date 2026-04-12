part of "../../auth.dart";

class ProfileUpdateEvent extends Equatable {
  final int userId;
  final String fullName;
  final String phoneNumber;
  final String? newPassword;

  const ProfileUpdateEvent({
    required this.userId,
    required this.fullName,
    required this.phoneNumber,
    this.newPassword,
  });

  @override
  List<Object?> get props => [userId, fullName, phoneNumber, newPassword];
}
