
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/features/series/domain/entities/episode.dart';
import 'package:tv_series/features/series/domain/use_cases/get_episodes.dart';

part 'episodes_event.dart';

part 'episodes_state.dart';

class EpisodesBloc
    extends Bloc<EpisodesEvent, EpisodesState> {
  final GetEpisodes getEpisodes;

  EpisodesBloc({required this.getEpisodes})
      : super(const EpisodesInitial(isLoading: true)) {
    on<EpisodesEvent>((event, emit) async {
      if (event is GetEpisodesEvent) {
        emit(const EpisodesInitial(isLoading: true));
        final episodesOrFailure = await getEpisodes(
            Params(seriesId: event.showId, seasonNumber: event.seasonNumber));
        await episodesOrFailure.fold((failure) {
          emit(const ErrorState(
              message: 'Ops,an error occurred loading your data'));
        }, (series) async {
          emit(LoadedEpisodesState(listOfEpisodes: series));
        });
      }
    });
  }
}
