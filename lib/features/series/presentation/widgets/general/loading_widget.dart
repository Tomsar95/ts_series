import 'package:flutter/material.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';

Widget loading() {
  return Column(
    children: [
      Expanded(
        child: Container(
          color: CustomColors.softBlack,
          child: const Center(
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                color: CustomColors.yellow,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}