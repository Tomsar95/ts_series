import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';
import 'package:tv_series/features/series/presentation/widgets/general/secondary_header.dart';
import 'package:tv_series/features/series/presentation/widgets/widgets.dart';

class PopularSeriesCarouselPage extends StatefulWidget {
  final List<Series> popularSeries;
  final int initialPosition;

  const PopularSeriesCarouselPage(
      {Key? key, required this.popularSeries, required this.initialPosition})
      : super(key: key);

  @override
  State<PopularSeriesCarouselPage> createState() =>
      _PopularSeriesCarouselPageState();
}

class _PopularSeriesCarouselPageState extends State<PopularSeriesCarouselPage> {
  late List<Series> currentPopularSeries;
  late int currentPosition;

  @override
  void initState() {
    currentPopularSeries = widget.popularSeries;
    currentPosition = widget.initialPosition;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: setDecoration(
                currentPopularSeries[currentPosition].backdropPath),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration:
                    BoxDecoration(color: CustomColors.black.withOpacity(0.5)),
              ),
            ),
          ),
          buildContent()
        ],
      ),
    );
  }

  Widget buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildSecondaryHeader(navigationFunction: _goBack, title : 'Popular'),
        buildCarousel(),
        buildFooter(),
        const SizedBox(height: 80,),
      ],
    );
  }

  Widget buildFooter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.7,
            child: Text(
              textAlign: TextAlign.center,
              currentPopularSeries[currentPosition].name,
              maxLines: 2,
              style: CustomTextStyles.gilroyBold
                  .copyWith(fontSize: 30),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: RatingBar.builder(
            initialRating: currentPopularSeries[currentPosition].voteAverage / 2,
            minRating: 1,
            direction: Axis.horizontal,
            itemCount: 5,
            ignoreGestures: true,
            itemPadding:
            const EdgeInsets.symmetric(horizontal: 2.0),
            unratedColor: CustomColors.darkerGray.withOpacity(0.8),
            itemSize: 17,
            allowHalfRating: true,
            itemBuilder: (context, _) => const Icon(
              Icons.star_outlined,
              color: CustomColors.darkGray,
            ),
            onRatingUpdate: (double value) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text('IMDb: ${currentPopularSeries[currentPosition].voteAverage}', style: CustomTextStyles.gilroyLight
              .copyWith(color: CustomColors.darkGray, fontSize: 14),),
        ),
        buildWatchButton(context: context, showId:  currentPopularSeries[currentPosition].id),
      ],
    );
  }

  Widget buildCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 0.7,
          height: 390,
          reverse: false,
          enlargeFactor: 0.4,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(() {
              currentPosition = index;
            });
          },
          initialPage: currentPosition),
      items: currentPopularSeries.map((series) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: setDecoration(series.posterPath),);
          },
        );
      }).toList(),
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
