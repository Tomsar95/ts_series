import 'package:tv_series/features/core/functions/general_functions.dart';
import 'package:tv_series/features/series/domain/entities/episode.dart';

class EpisodeModel extends Episode {
  const EpisodeModel({
    required int id,
    required int showId,
    required int episodeNumber,
    required String name,
    required String airDate,
    required String overview,
    String? stillPath,
    required int seasonNumber,
    required double voteAverage,
  }) : super(
          id: id,
          showId: showId,
          name: name,
          airDate: airDate,
          overview: overview,
          stillPath: stillPath,
          voteAverage: voteAverage,
          seasonNumber: seasonNumber,
          episodeNumber: episodeNumber,
        );

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      id: json['id'],
      showId: json['show_id'] ?? 0,
      episodeNumber: json['episode_number'],
      name: json['name'] ?? '',
      airDate: json['first_air_date'] ?? '',
      overview: json['overview'] ?? '',
      stillPath: GeneralFunctions.setImageRouteCard(json['still_path']),
      voteAverage: json['vote_average'].toDouble(),
      seasonNumber: json['season_number'],
    );
  }
}
