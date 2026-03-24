class RegisterModel {
  final String name;
  final String phone;
  final String password;

  RegisterModel({
    required this.name,
    required this.phone,
    required this.password,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      name: json['name'],
      phone: json['phone'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'password': password,
    };
  }
}