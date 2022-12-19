import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';
import 'package:tv_series/features/series/presentation/widgets/general/custom_shader_mask.dart';

Widget buildRecentScroll(
    List<Series> series, BuildContext context, ScrollController controller) {
  return Flexible(
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
      itemCount: series.length,
      itemBuilder: (context, index) {
        return airingSeriesVerticalCard(series, context, index);
      },
    ),
  );
}

Widget airingSeriesVerticalCard(
    List<Series> series, BuildContext context, int index) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height*0.6 ,
    child: Stack(
      children: [
        customShaderMask(
          bottomFade: 0.05,
            child: Container(
              decoration: setDecoration(
                  series[index].backdropPath),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    decoration: BoxDecoration(color: CustomColors.black.withOpacity(0.4)),
                  ),
                ),
              ),
            )
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 20,),
              Container(
                height: MediaQuery.of(context).size.width*0.8,
                width: MediaQuery.of(context).size.width*0.8,
                decoration: setDecoration(series[index].posterPath),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    series[index].name,
                    maxLines: 2,
                    style: CustomTextStyles.gilroyBoldTitle.copyWith(fontSize: 30),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2.0, bottom: 14),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    '2 Episodes of 20',
                    maxLines: 2,
                    style: CustomTextStyles.gilroyLightTitle.copyWith(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Go to view',
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
          ),
        ),
      ],
    ),
  );
}

BoxDecoration setDecoration(String? imgPath) {
  if (imgPath == null) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: CustomColors.black,
    );
  } else {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image:
            DecorationImage(image: NetworkImage(imgPath), fit: BoxFit.cover));
  }
}
