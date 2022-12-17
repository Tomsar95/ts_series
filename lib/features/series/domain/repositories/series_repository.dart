import 'package:dartz/dartz.dart';
import 'package:tv_series/features/core/error/failures.dart';
import 'package:tv_series/features/login/domain/usecases/set_user.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';

abstract class SeriesRepository {
  Future<Either<Failure,List<Series>>> getSeries();
  Future<Either<Failure,Series>> getSeriesDetails(int seriesId);
}