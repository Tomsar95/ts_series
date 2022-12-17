import 'package:tv_series/features/series/domain/entities/series.dart';

class SeriesModel extends Series {

  const SeriesModel({
    required String name,
    required String airDate,
    required String overview,
    required String backdropPath,
    required String posterPath,
    required double voteAverage,
}) : super (
    name : name,
    airDate: airDate,
    overview: overview,
    backdropPath: backdropPath,
    posterPath: posterPath,
    voteAverage: voteAverage,
  );

  factory SeriesModel.fromJson(Map<String, dynamic> json) {
    return SeriesModel(
      name: json['name'] ?? '',
      airDate: json['first_air_date'] ?? '',
      overview: json['overview'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      posterPath: json['poster_path'] ?? '',
      voteAverage: json['vote_average'].toDouble(),
    );
  }
}

