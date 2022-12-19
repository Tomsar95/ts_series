import 'package:flutter/material.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';
import 'package:tv_series/features/series/domain/entities/episode.dart';
import 'package:tv_series/features/series/presentation/widgets/widgets.dart';

Widget buildEpisodesScroll(List<Episode> episodes, BuildContext context, ScrollController controller) {
  return Expanded(
    child: ListView.separated(
      separatorBuilder: (context, index) => Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width*0.70,
          child: Divider(
            thickness: 2,
            color: CustomColors.darkGraySemiTransparent,
          ),
        ),
      ),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      controller: controller,
      itemCount: episodes.length,
      itemBuilder: (context, index) {
        return episodeCard(episodes[index]);
      },
    ),
  );
}