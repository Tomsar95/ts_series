import 'package:flutter/material.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';

import 'recommended_series_scroll_widget.dart';

Widget buildFavoritesScroll(List<Series> series, BuildContext context, ScrollController controller) {
  return Flexible(
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      controller: controller,
      itemCount: series.length,
      itemBuilder: (context, index) {
        return recommendedSeriesHorizontalCard(series ,context, index);
      },
    ),
  );
}