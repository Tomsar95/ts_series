import 'package:tv_series/features/login/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({required String name, required String password})
      : super(name: name, password: password);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'password': password,
    };
  }

}
