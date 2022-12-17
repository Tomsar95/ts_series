import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/features/core/error/failures.dart';
import 'package:tv_series/features/core/usecases/usecase.dart';
import 'package:tv_series/features/login/data/models/user_model.dart';
import 'package:tv_series/features/login/domain/entities/user.dart';
import 'package:tv_series/features/login/domain/repositories/user_repository.dart';

class SetUser implements UseCase<User, Params> {

  final UserRepository repository;

  SetUser(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.setUser(params.user);
  }
}

class Params extends Equatable {
  final User user;

  const Params({required this.user}) : super();

  @override
  List<Object?> get props => throw UnimplementedError();
}