import 'package:dartz/dartz.dart';
import 'package:tv_series/features/core/error/failures.dart';
import 'package:tv_series/features/login/data/models/user_model.dart';
import 'package:tv_series/features/login/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUser();
  Future<Either<Failure, User>> setUser(User user);
  Future<Either<Failure, bool>> tryToAuthenticate(User user);
}