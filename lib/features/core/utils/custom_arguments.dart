import 'package:tv_series/features/series/domain/entities/series.dart';

class PopularSeriesScreenArguments {
  final List<Series> popularSeries;
  final int initialPosition;

  PopularSeriesScreenArguments({required this.popularSeries, required this.initialPosition});
}

class EpisodeDetailsArguments {
  final int showId;
  final int seasonNumber;

  EpisodeDetailsArguments({required this.showId, required this.seasonNumber});
}