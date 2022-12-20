import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/features/core/functions/general_functions.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';
import 'package:tv_series/features/series/presentation/blocs/details_component_bloc/details_component_bloc.dart';
import 'package:tv_series/features/series/presentation/widgets/general/message_display.dart';
import 'package:tv_series/features/series/presentation/widgets/general/secondary_header.dart';
import 'package:tv_series/features/series/presentation/widgets/widgets.dart';
import 'package:tv_series/injection_container.dart';

class EpisodesDetailPage extends StatefulWidget {
  final int seriesId;

  const EpisodesDetailPage({Key? key, required this.seriesId})
      : super(key: key);

  @override
  State<EpisodesDetailPage> createState() => _EpisodesDetailPageState();
}

class _EpisodesDetailPageState extends State<EpisodesDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<DetailsComponentBloc>(),
      child: BlocBuilder<DetailsComponentBloc, DetailsComponentState>(
        builder: (context, state) {
          if (state is DetailsComponentInitial) {
            context
                .read<DetailsComponentBloc>()
                .add(GetSeriesEvent(id: widget.seriesId));
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: const Center(
                child: CircularProgressIndicator(
                  color: CustomColors.yellow,
                ),
              ),
            );
          } else if (state is LoadedSeriesState) {
            return buildContent(state.series, context);
          } else if (state is ErrorState) {
            return MessageDisplay(message: state.message);
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: const Placeholder(),
          );
        },
      ),
    );
  }

  Widget buildContent(Series series, BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.transparent,
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1,1],
                colors: [CustomColors.softBlack, CustomColors.transparent],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Container(
              decoration: setDecoration(series.backdropPath),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  decoration:
                  BoxDecoration(color: CustomColors.black.withOpacity(0.5)),
                ),
              ),
            ),
          ),

          Column(
            children: [
              buildSecondaryHeader(
                addToFavorites: AddToFavorites(context: context, series: series),
                  navigationFunction: _goBack,
                  title: series.name,
              ),
              buildEpisodeInfo(series),
            ],
          ),
        ],
      ),
    );
  }

  BoxDecoration setDecoration(String? imgPath) {
    if (imgPath == null) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        gradient: CustomColors.backGroundGradient,
      );
    } else {
      return BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          gradient: CustomColors.backGroundGradient,
          image:
              DecorationImage(image: NetworkImage(imgPath), fit: BoxFit.cover));
    }
  }

  void _goBack() {
    Navigator.of(context).pop();
  }
}
