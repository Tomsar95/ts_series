import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/features/series/domain/entities/episode.dart';
import 'package:tv_series/features/series/domain/use_cases/get_episode.dart';

part 'episode_details_event.dart';

part 'episode_details_state.dart';

class EpisodeDetailsBloc
    extends Bloc<EpisodeDetailsEvent, EpisodeDetailsState> {
  final GetEpisode getEpisode;
  int currentEpisode = 1;
  int currentNumberOfEpisodes = 1;
  int currentNumberOfSeasons = 1;

  EpisodeDetailsBloc({required this.getEpisode})
      : super(const EpisodeDetailsInitial(isLoading: true)) {
    on<EpisodeDetailsEvent>((event, emit) async {
      if (event is GetEpisodeEvent) {

        if(event.numberOfEpisodes != null && event.numberOfSeasons != null){
          currentNumberOfEpisodes = event.numberOfEpisodes!;
          currentNumberOfSeasons = event.numberOfSeasons!;
        }

        if(currentEpisode <= currentNumberOfEpisodes){

          emit(LoadingState());

          final episodesOrFailure = await getEpisode(Params(
              seriesId: event.showId,
              seasonNumber: 1,
              episodeNumber: currentEpisode));
          await episodesOrFailure.fold((failure) {
            emit(const ErrorState(
                message: 'Ops, an error occurred loading your data'));
          }, (series) async {
            emit(LoadedEpisodeState(episodeInfo: series));
            currentEpisode += 1;
          });

        } else {
          currentEpisode = 1;

          final episodesOrFailure = await getEpisode(Params(
              seriesId: event.showId,
              seasonNumber: 1,
              episodeNumber: currentEpisode));
          await episodesOrFailure.fold((failure) {
            emit(const ErrorState(
                message: 'Ops, an error occurred loading your data'));
          }, (series) async {
            emit(LoadedEpisodeState(episodeInfo: series));
          });
        }

      }
    });
  }
}
