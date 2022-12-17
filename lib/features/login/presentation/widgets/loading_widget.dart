import 'package:flutter/material.dart';
import 'package:tv_series/features/core/utils/general_colors.dart';

Widget loading() {
  return const Center(
    child: SizedBox(
      height: 30,
      width: 30,
      child: CircularProgressIndicator(
        color: GeneralColors.yellow,
      ),
    ),
  );
}