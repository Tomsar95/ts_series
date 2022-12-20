import 'package:equatable/equatable.dart';

class Series extends Equatable {
  final int id;
  final String name;
  final String airDate;
  final String overview;
  final String? backdropPath;
  final String? posterPath;
  final double voteAverage;
  final int numberOfEpisodes;
  final int numberOfSeasons;

  const Series({
    required this.id,
    required this.name,
    required this.airDate,
    required this.overview,
    this.backdropPath,
    this.posterPath,
    required this.voteAverage,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
});

  @override
  List<Object> get props => [];
}