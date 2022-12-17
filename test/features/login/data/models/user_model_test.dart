import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/features/login/data/models/user_model.dart';
import 'package:tv_series/features/login/domain/entities/user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tUserModel = UserModel(
      name: 'tomas',
      password: 'tom123',
      );

  test('should be a user entity', () {
    //assert
    expect(tUserModel, isA<User>());
  });

  group('fromJson', () {
    test('should return a valid model', () async {
      //arrange
      final Map<String, dynamic> jsonMap =
      json.decode(fixture('user.json'));
      //act
      Iterable i = jsonMap['results'];
      List<UserModel> tempList = i.map((user) => UserModel.fromJson(user)).toList();
      final result = tempList.first;
      //assert
      expect(result, tUserModel);
    });
  });
}