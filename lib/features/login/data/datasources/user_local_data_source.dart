import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tv_series/features/core/error/exceptions.dart';
import 'package:tv_series/features/core/utils/cached_users.dart';
import 'package:tv_series/features/login/data/models/user_model.dart';
import 'package:tv_series/features/login/domain/entities/user.dart';


abstract class UserLocalDataSource {

  Future<UserModel>? getUser();

  Future<void>? cacheUser(UserModel userToCache);

  Future<bool> checkCachedUsers(UserModel user);
}

const cachedUserKey = 'CACHED_USER';

class UserLocalDataSourceImpl implements UserLocalDataSource {

  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<UserModel> getUser() {
    final jsonString = sharedPreferences.getString(cachedUserKey);
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException('cache is null');
    }
  }

  @override
  Future<void>? cacheUser(UserModel userToCache) {
    return sharedPreferences.setString(
        cachedUserKey, json.encode(userToCache.toJson()));
  }

  @override
  Future<bool> checkCachedUsers(UserModel user) {
    bool successOrFailure = false;
    for (var cachedUser in CachedUsers.users) {
      if(cachedUser.name == user.name && cachedUser.password == user.password) successOrFailure = true;
    }
    return Future.value(successOrFailure);
  }
  
}