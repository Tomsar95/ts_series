import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';
import 'package:tv_series/features/series/domain/entities/episode.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';
import 'package:tv_series/features/series/presentation/blocs/episode_details_bloc/episode_details_bloc.dart';
import 'package:tv_series/features/series/presentation/widgets/widgets.dart';
import 'package:tv_series/injection_container.dart';

Widget buildEpisodeInfo(Series series) {
  return BlocProvider(
    create: (_) => serviceLocator<EpisodeDetailsBloc>(),
    child: BlocBuilder<EpisodeDetailsBloc, EpisodeDetailsState>(
      builder: (context, state) {
        if (state is EpisodeDetailsInitial) {
          context.read<EpisodeDetailsBloc>().add(GetEpisodeEvent(
              showId: series.id,
              numberOfSeasons: series.numberOfSeasons,
              numberOfEpisodes: series.numberOfEpisodes));
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: const Center(
              child: CircularProgressIndicator(
                color: CustomColors.yellow,
              ),
            ),
          );
        } else if (state is LoadedEpisodeState) {
          return buildContent(state.episodeInfo, context, series.id);
        }  else if (state is LoadingState) {
          return const Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Center(child: CircularProgressIndicator(color: CustomColors.yellow),),
          );
        } else if (state is ErrorState) {
          return Center(
              child: Text(
            state.message,
            style: CustomTextStyles.gilroyLight,
          ));
        }
        return SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: const Placeholder(),
        );
      },
    ),
  );
}

Widget buildContent(Episode episode, BuildContext context, int seriesId) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 50.0, top: 20),
          child: episodeCard(
              episode: episode,
              secondaryFn: (){
                _getNext(context, episode, seriesId);
              },
              element: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Next',style: CustomTextStyles.gilroyLight),
                  const Icon(Icons.navigate_next, size: 22, color: CustomColors.white,)
                ],
              ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only( bottom: 20.0, right: 20, left: 20),
          child: Text(episode.name, style: CustomTextStyles.gilroyBoldTitle.copyWith(fontSize: 30),),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('IMDb: ${episode.voteAverage} | ${episode.airDate} | ${episode.seasonNumber} Season', style: CustomTextStyles.gilroyLight.copyWith(color: CustomColors.darkGray, fontSize: 12),),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only( bottom: 16.0, right: 20, left: 20),
          child: Divider(
            thickness: 2,
            color: CustomColors.darkGraySemiTransparent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only( bottom: 20.0, right: 20, left: 20),
          child: Text(episode.overview, style: CustomTextStyles.gilroyLight.copyWith(fontSize: 18),),
        ),
      ],
    ),
  );
}

void _getNext(BuildContext context, Episode episode, int seriesId) {
  context.read<EpisodeDetailsBloc>().add(GetEpisodeEvent(
      showId: seriesId));
}
