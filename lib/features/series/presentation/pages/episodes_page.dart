import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';
import 'package:tv_series/features/core/utils/custom_navigator.dart';
import 'package:tv_series/features/core/utils/utils.dart';
import 'package:tv_series/features/series/domain/entities/episode.dart';
import 'package:tv_series/features/series/presentation/blocs/episodes_bloc/episodes_bloc.dart';
import 'package:tv_series/features/series/presentation/widgets/widgets.dart';
import 'package:tv_series/injection_container.dart';

class EpisodesPage extends StatefulWidget {

  final int showId;
  final int showNumber;

  const EpisodesPage({Key? key, required this.showId, required this.showNumber}) : super(key: key);

  @override
  State<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {

  late int currentEpisode;
  late ScrollController  _scrollController;

  @override
  void initState() {
    _scrollController =  ScrollController();
    currentEpisode = widget.showNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.softBlack,
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<EpisodesBloc>(),
      child: BlocBuilder<EpisodesBloc, EpisodesState>(
        builder: (context, state) {
          if (state is EpisodesInitial) {
            context.read<EpisodesBloc>().add(GetEpisodesEvent(showId: widget.showId, seasonNumber: currentEpisode));
            return loading();
          } else if (state is LoadedEpisodesState) {
            return buildContent(state.listOfEpisodes, context);
          } else if (state is ErrorState) {
            return Column(
              children: [
                buildSecondaryHeader(navigationFunction: _goBack, title: 'Popular'),
                const SizedBox(height: 20,),
                MessageDisplay(message: state.message)
              ],
            );
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: const Placeholder(),
          );
        },
      ),
    );
  }

  Widget buildContent(List<Episode> episodes, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildPrincipalHeader(label: 'Recent', callBack: _closeSession),
        buildSecondaryHeader(navigationFunction: _goBack, title: 'Popular', customTopPadding: 16),
        buildEpisodesScroll(episodes, context, _scrollController),
      ],
    );
  }

  void _closeSession() {
    Utils.mustReset = true;
    Navigator.of(context).pushReplacementNamed(CustomRoutes.login);
  }

  void _goBack() {
    Navigator.of(context).pop();
  }
}
