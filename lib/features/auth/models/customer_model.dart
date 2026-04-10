import 'package:equatable/equatable.dart';

class CustomerModel extends Equatable {
  final int? id;
  final String? fullName;
  final String? phoneNumber;
  final String? role;
  final String? token;

  const CustomerModel({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.role,
    this.token,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    // The API might return the user object inside a "user" key, "result" key, or directly
    final Map<String, dynamic> root = json['result'] ?? json;
    final Map<String, dynamic> userData = root['user'] ?? root;

    return CustomerModel(
      id: userData['id'] as int? ?? userData['userId'] as int?,
      fullName: userData['fullName'] as String? ??
          userData['full_name'] as String? ??
          userData['name'] as String? ??
          userData['customer_name'] as String? ??
          userData['display_name'] as String? ??
          userData['userName'] as String?,
      phoneNumber: userData['phoneNumber'] as String? ??
          userData['phone_number'] as String? ??
          userData['phone'] as String? ??
          userData['mobile'] as String?,
      role: userData['role'] as String?,
      token: root['token'] as String? ?? json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'role': role,
      'token': token,
    };
  }

  CustomerModel copyWith({
    int? id,
    String? fullName,
    String? phoneNumber,
    String? role,
    String? token,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      role: role ?? this.role,
      token: token ?? this.token,
    );
  }

  @override
  List<Object?> get props => [id, fullName, phoneNumber, role, token];
}
