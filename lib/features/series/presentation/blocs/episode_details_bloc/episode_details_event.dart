part of 'episode_details_bloc.dart';

abstract class EpisodeDetailsEvent extends Equatable {
  const EpisodeDetailsEvent();
}

class GetEpisodeEvent extends EpisodeDetailsEvent{

  final int showId;
  final int? numberOfSeasons;
  final int? numberOfEpisodes;

  const GetEpisodeEvent({required this.showId, this.numberOfSeasons, this.numberOfEpisodes});

  @override
  List<Object?> get props => [];
}

