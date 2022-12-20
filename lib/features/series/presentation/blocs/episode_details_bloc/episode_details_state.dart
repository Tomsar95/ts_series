part of 'episode_details_bloc.dart';

abstract class EpisodeDetailsState extends Equatable {
  const EpisodeDetailsState();
}

class EpisodeDetailsInitial extends EpisodeDetailsState {
  final bool isLoading;

  const EpisodeDetailsInitial({required this.isLoading});

  @override
  List<Object> get props => [];
}

class LoadedEpisodeState extends EpisodeDetailsState {

  final Episode episodeInfo;

  const LoadedEpisodeState({required this.episodeInfo});

  @override
  List<Object> get props => [];
}

class LoadingState extends EpisodeDetailsState {

  @override
  List<Object> get props => [];
}

class EmptyState extends EpisodeDetailsState {
  @override
  List<Object> get props => [];
}

class ErrorState extends EpisodeDetailsState {

  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [];
}
