import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/features/core/error/failures.dart';
import 'package:tv_series/features/core/usecases/usecase.dart';
import 'package:tv_series/features/series/domain/entities/episode.dart';
import 'package:tv_series/features/series/domain/repositories/series_repository.dart';

class GetEpisodes implements UseCase<List<Episode>, Params>{
  final SeriesRepository repository;

  GetEpisodes(this.repository);

  @override
  Future<Either<Failure, List<Episode>>> call(Params params) async {
    return await repository.getEpisodes(params.seriesId, params.seasonNumber);
  }

}

class Params extends Equatable {
  final int seriesId;
  final int seasonNumber;

  const Params({required this.seriesId, required this.seasonNumber}) : super();

  @override
  List<Object?> get props => throw UnimplementedError();
}