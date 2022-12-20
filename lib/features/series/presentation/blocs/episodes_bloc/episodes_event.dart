part of 'episodes_bloc.dart';

abstract class EpisodesEvent extends Equatable {
  const EpisodesEvent();
}

class GetEpisodesEvent extends EpisodesEvent{

  final int showId;
  final int seasonNumber;

  const GetEpisodesEvent({required this.showId, required this.seasonNumber});

  @override
  List<Object?> get props => [];
}