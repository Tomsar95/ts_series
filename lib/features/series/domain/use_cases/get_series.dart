import 'package:dartz/dartz.dart';
import 'package:tv_series/features/core/error/failures.dart';
import 'package:tv_series/features/core/usecases/usecase.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';
import 'package:tv_series/features/series/domain/repositories/series_repository.dart';

class GetSeries implements UseCase<List<Series>, NoParams> {

  final SeriesRepository repository;

  GetSeries(this.repository);

  @override
  Future<Either<Failure, List<Series>>> call(NoParams params) async {
    return await repository.getSeries();
  }

}