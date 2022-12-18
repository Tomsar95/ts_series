import 'package:flutter/material.dart';
import 'package:tv_series/features/core/utils/general_colors.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';

Widget buildWatchButton(BuildContext context, double? fontSize, double? width ) {
  double newFontSize = fontSize ?? 20;
  double newWidth = width ?? MediaQuery.of(context).size.width * 0.5;
  return TextButton(
    style: ButtonStyle(
      backgroundColor:
      MaterialStateProperty.all<Color>(GeneralColors.yellow),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          )),
    ),
    onPressed: () {},
    child: SizedBox(
      width: newWidth,
      child: Center(
        child: Text(
          'Watch Now',
          style: CustomTextStyles.gilroyLight
              .copyWith(color: GeneralColors.black, fontSize: newFontSize),
        ),
      ),
    ),
  );
}