import 'package:flutter/material.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';

Widget buildTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0, top: 20, left: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomTextStyles.gilroyBold.copyWith(fontSize: 26),
          textAlign: TextAlign.left,
        ),
      ],
    ),
  );
}