import 'package:equatable/equatable.dart';

class Series extends Equatable {
  final String name;
  final String airDate;
  final String overview;
  final String? backdropPath;
  final String? posterPath;
  final double voteAverage;

  const Series({
    required this.name,
    required this.airDate,
    required this.overview,
    this.backdropPath,
    this.posterPath,
    required this.voteAverage,
});

  @override
  List<Object> get props => [];
}