import 'package:flutter/material.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';
import 'package:tv_series/features/series/presentation/widgets/widgets.dart';

import 'recommended_series_scroll_widget.dart';

Widget buildFavoritesScroll(List<Series> series, BuildContext context, ScrollController controller) {
  return Flexible(
    child: ListView.separated(
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: Divider(
          thickness: 1.3,
          color: CustomColors.darkGray,
        ),
      ),
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