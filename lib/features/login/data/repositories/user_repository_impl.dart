import 'package:dartz/dartz.dart';
import 'package:tv_series/features/core/error/exceptions.dart';
import 'package:tv_series/features/core/error/failures.dart';
import 'package:tv_series/features/core/utils/utils.dart';
import 'package:tv_series/features/login/data/datasources/user_local_data_source.dart';
import 'package:tv_series/features/login/data/models/user_model.dart';
import 'package:tv_series/features/login/domain/entities/user.dart';
import 'package:tv_series/features/login/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {

  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, User>> getUser() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final localUser = await localDataSource.getUser();
      return Right(localUser!);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, User>> setUser(User user) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      localDataSource.cacheUser(UserModel(name: user.name, password: user.password as String));
      return Right(user);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> tryToAuthenticate(User user) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final canLogin = await localDataSource.checkCachedUsers(UserModel(name: user.name, password: user.password as String));
      if(canLogin){
        return const Right(true);
      } else {
        return Left(CacheFailure());
      }
    } on CacheException {
      return Left(CacheFailure());
    }
  }

}