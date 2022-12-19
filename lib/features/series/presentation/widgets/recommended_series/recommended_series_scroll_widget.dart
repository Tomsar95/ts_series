import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';
import 'package:tv_series/features/series/presentation/widgets/widgets.dart';

Widget buildRecommendedScroll(List<Series> series, BuildContext context, ScrollController controller) {
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

Widget recommendedSeriesHorizontalCard(List<Series> series,BuildContext context, int index) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 28.0, left: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 140,
          width: 140,
          decoration: setDecoration(series[index].posterPath),
        ),
        const SizedBox(width: 30,),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: SizedBox(
                  width: 170,
                  child: Text(
                    series[index].name,
                    maxLines: 2,
                    style: CustomTextStyles.gilroyLightTitle
                        .copyWith(fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              RatingBar.builder(
                initialRating: series[index].voteAverage / 2,
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                ignoreGestures: true,
                itemPadding:
                const EdgeInsets.symmetric(horizontal: 2.0),
                unratedColor: CustomColors.darkGray,
                itemSize: 11,
                allowHalfRating: true,
                itemBuilder: (context, _) => const Icon(
                  Icons.star_outlined,
                  color: CustomColors.lightGray,
                ),
                onRatingUpdate: (double value) {},
              ),
              const SizedBox(height: 15,),
              SizedBox(
                width: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildWatchButton(context, 14, 100),
                    AddToFavorites(context: context, series: series[index])
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

BoxDecoration setDecoration(String? imgPath) {
  if (imgPath == null) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(18.0),
      color: CustomColors.black,
    );
  } else {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        image:
        DecorationImage(image: NetworkImage(imgPath), fit: BoxFit.cover));
  }
}