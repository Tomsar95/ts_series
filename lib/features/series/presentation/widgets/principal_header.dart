import 'package:flutter/material.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';

Widget buildPrincipalHeader({required String label, required Function callBack}) {
  return Padding(
    padding: const EdgeInsets.only(top: 40.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 30.0),
        Text(
          label,
          style: CustomTextStyles.gilroyLightTitle.copyWith(fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
                onTap: () {
                  callBack();
                },
                child: const Icon(
                  Icons.settings_outlined,
                  color: CustomColors.darkGray,
                  size: 30,
                )),
          ),
        ),
      ],
    ),
  );
}