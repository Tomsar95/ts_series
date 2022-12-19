import 'package:flutter/material.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';
import 'package:tv_series/features/series/domain/entities/episode.dart';

Widget episodeCard(Episode episode) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, top: 16),
          child: Text('${episode.episodeNumber} Episode', style: CustomTextStyles.gilroyBold,),
        ),
        Container(
          height: 200,
          decoration: _setDecoration(episode.stillPath),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(23),
              child: Container(
                height: 46,
                width: 46,
                color: CustomColors.yellow,
                child: const Icon(Icons.play_arrow, color: CustomColors.softBlack, size: 20,),
              ),
            ),
          ),
        ),
        const SizedBox(height: 18,)
      ],
    ),
  );
}


BoxDecoration _setDecoration(String? imgPath) {
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