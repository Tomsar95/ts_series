import 'package:tv_series/features/core/functions/general_functions.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';

class SeriesModel extends Series {

  const SeriesModel({
    required int id,
    required String name,
    required String airDate,
    required String overview,
    String? backdropPath,
    String? posterPath,
    required int numberOfEpisodes,
    required int numberOfSeasons,
    required double voteAverage,
}) : super (
    id: id,
    name : name,
    airDate: airDate,
    overview: overview,
    backdropPath: backdropPath,
    posterPath: posterPath,
    voteAverage: voteAverage,
    numberOfEpisodes: numberOfEpisodes,
    numberOfSeasons: numberOfSeasons
  );

  factory SeriesModel.fromJson(Map<String, dynamic> json) {
    return SeriesModel(
      name: json['name'] ?? '',
      id: json['id'],
      airDate: json['first_air_date'] ?? '',
      overview: json['overview'] ?? '',
      backdropPath: GeneralFunctions.setImageRouteBG(json['backdrop_path']),
      posterPath: GeneralFunctions.setImageRouteCard(json['poster_path']),
      voteAverage: json['vote_average'].toDouble(),
      numberOfEpisodes: json['number_of_episodes'] ?? 0,
      numberOfSeasons: json['number_of_seasons'] ?? 0,
    );
  }
}

