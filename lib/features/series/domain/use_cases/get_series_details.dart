import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/features/core/error/failures.dart';
import 'package:tv_series/features/core/usecases/usecase.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';
import 'package:tv_series/features/series/domain/repositories/series_repository.dart';

class GetSeriesDetails implements UseCase<Series, Params>{
  final SeriesRepository repository;

  GetSeriesDetails(this.repository);

  @override
  Future<Either<Failure, Series>> call(Params params) async {
    return await repository.getSeriesDetails(params.seriesId);
  }
}

class Params extends Equatable {
  final int seriesId;

  const Params({required this.seriesId}) : super();

  @override
  List<Object?> get props => throw UnimplementedError();
}