import 'package:dartz/dartz.dart';
import 'package:tv_series/features/core/error/failures.dart';
import 'package:tv_series/features/core/usecases/usecase.dart';
import 'package:tv_series/features/login/domain/repositories/user_repository.dart';
import 'package:tv_series/features/login/domain/usecases/set_user.dart';

class TryToAuthenticate implements UseCase<bool, Params> {

  final UserRepository repository;

  TryToAuthenticate(this.repository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.tryToAuthenticate(params.user);
  }
}