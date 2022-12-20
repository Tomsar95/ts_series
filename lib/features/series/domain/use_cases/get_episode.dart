
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/features/core/error/failures.dart';
import 'package:tv_series/features/core/usecases/usecase.dart';
import 'package:tv_series/features/series/domain/entities/episode.dart';
import 'package:tv_series/features/series/domain/repositories/series_repository.dart';

class GetEpisode implements UseCase<Episode, Params>{
  final SeriesRepository repository;

  GetEpisode(this.repository);

  @override
  Future<Either<Failure, Episode>> call(Params params) async {
    return await repository.getEpisode(params.seriesId, params.seasonNumber, params.episodeNumber);
  }

}

class Params extends Equatable {
  final int seriesId;
  final int seasonNumber;
  final int episodeNumber;

  const Params({required this.seriesId, required this.seasonNumber, required this.episodeNumber}) : super();

  @override
  List<Object?> get props => throw UnimplementedError();
}