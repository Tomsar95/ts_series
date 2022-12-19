import 'package:flutter/material.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';

Widget scrollPlaceHolder(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
    child: Text(
      'Ops, there are no series available',
      style:
      CustomTextStyles.gilroyBold.copyWith(color: CustomColors.darkGray),
    ),
  );
}