import 'package:flutter/material.dart';
import 'package:tv_series/features/core/utils/custom_arguments.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';
import 'package:tv_series/features/core/utils/custom_navigator.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';

Widget buildWatchButton(
    {required BuildContext context, double? fontSize, double? width, required int showId}) {
  double newFontSize = fontSize ?? 20;
  double newWidth = width ?? MediaQuery.of(context).size.width * 0.5;
  return TextButton(
    style: ButtonStyle(
      backgroundColor:
      MaterialStateProperty.all<Color>(CustomColors.yellow),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          )),
    ),
    onPressed: () {
      _goToView(showId, context);
    },
    child: SizedBox(
      width: newWidth,
      child: Center(
        child: Text(
          'Watch Now',
          style: CustomTextStyles.gilroyLight
              .copyWith(color: CustomColors.black, fontSize: newFontSize),
        ),
      ),
    ),
  );
}

void _goToView(int id, BuildContext context) {
  Navigator.of(context).pushNamed(CustomRoutes.episodeDetails,
      arguments: EpisodeDetailsArguments(showId: id));
}