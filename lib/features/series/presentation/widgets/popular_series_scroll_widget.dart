import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tv_series/features/core/utils/custom_arguments.dart';
import 'package:tv_series/features/core/utils/custom_navigator.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';

Widget buildPopularScroll(List<Series> series, BuildContext context, ScrollController controller) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        height: 316.0,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: controller,
          itemCount: series.length,
          itemBuilder: (context, index) {
            return popularSeriesVerticalCard(series ,context, index);
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 10.0, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'See All',
              style: CustomTextStyles.gilroyLightTitle
                  .copyWith(fontSize: 20, color: CustomColors.yellow),
            ),
            const Icon(
              Icons.navigate_next,
              color: CustomColors.yellow,
              size: 26,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget popularSeriesVerticalCard(List<Series> series,BuildContext context, int index) {
  return Align(
    alignment: Alignment.topCenter,
    child: GestureDetector(
      onTap: () {
        _goToPopularCarouselPage(series, index, context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: 140,
            decoration: setDecoration(series[index].posterPath),
            margin: const EdgeInsets.only(right: 20.0, top: 10, bottom: 10),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0, bottom: 18),
            child: SizedBox(
              width: 140,
              child: Text(
                series[index].name,
                maxLines: 2,
                style: CustomTextStyles.gilroyLightTitle
                    .copyWith(fontSize: 20),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: RatingBar.builder(
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
          ),
        ],
      ),
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

void _goToPopularCarouselPage(List<Series> series, int index, BuildContext context) {
  Navigator.of(context).pushNamed(CustomRoutes.popularCarrousel,
      arguments: PopularSeriesScreenArguments(popularSeries: series, initialPosition: index));
}