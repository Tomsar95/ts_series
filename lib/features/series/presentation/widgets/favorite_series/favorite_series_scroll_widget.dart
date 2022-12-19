import 'package:flutter/material.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';
import 'package:tv_series/features/series/presentation/widgets/widgets.dart';

Widget buildFavoritesScroll(List<Series> series, BuildContext context, ScrollController controller) {
  return Flexible(
    child: ListView.builder(
      /*separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20),
        child: Divider(
          thickness: 2,
          color: CustomColors.darkGraySemiTransparent,
        ),
      ),*/
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      controller: controller,
      itemCount: series.length,
      itemBuilder: (context, index) {
        return favoritesSeriesCard(series ,context, index);
      },
    ),
  );
}