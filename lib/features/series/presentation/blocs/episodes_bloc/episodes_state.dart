part of 'episodes_bloc.dart';

abstract class EpisodesState extends Equatable {
  const EpisodesState();
}

class EpisodesInitial extends EpisodesState {
  final bool isLoading;

  const EpisodesInitial({required this.isLoading});

  @override
  List<Object> get props => [];
}

class LoadedEpisodesState extends EpisodesState {

  final List<Episode> listOfEpisodes;

  const LoadedEpisodesState({required this.listOfEpisodes});

  @override
  List<Object> get props => [];
}

class EmptyState extends EpisodesState {
  @override
  List<Object> get props => [];
}

class ErrorState extends EpisodesState {

  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [];
}
