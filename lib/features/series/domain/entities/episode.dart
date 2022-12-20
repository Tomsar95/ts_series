import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  final int id;
  final int showId;
  final int episodeNumber;
  final String name;
  final String airDate;
  final String overview;
  final int seasonNumber;
  final String? stillPath;
  final double voteAverage;

  const Episode({
    required this.id,
    required this.showId,
    required this.episodeNumber,
    required this.seasonNumber,
    required this.name,
    required this.airDate,
    required this.overview,
    this.stillPath,
    required this.voteAverage,
});

  @override
  List<Object> get props => [];
}