import 'package:flutter/material.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';

Widget scrollPlaceHolder(BuildContext context) {
  return SizedBox(
    height: 220.0,
    width: MediaQuery.of(context).size.width,
    child: Text(
      'Ops, there are no series available',
      style:
      CustomTextStyles.gilroyBold.copyWith(color: CustomColors.darkGray),
    ),
  );
}