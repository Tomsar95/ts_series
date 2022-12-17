import 'package:tv_series/features/login/domain/entities/user.dart';

class CachedUsers {
  static const List<User> users = [
    User(name: 'maria', password: 'password'),
    User(name: 'pedro', password: '123456'),
  ];
}