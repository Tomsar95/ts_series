import 'package:tv_series/features/series/domain/entities/series.dart';

class PopularSeriesScreenArguments {
  final List<Series> popularSeries;
  final int initialPosition;

  PopularSeriesScreenArguments({required this.popularSeries, required this.initialPosition});
}

class EpisodesViewArguments {
  final int showId;
  final int seasonNumber;

  EpisodesViewArguments({required this.showId, required this.seasonNumber});
}

class EpisodeDetailsArguments {
  final int showId;

  EpisodeDetailsArguments({required this.showId});
}
