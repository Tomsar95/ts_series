import 'package:flutter/material.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';

Widget buildSecondaryHeader({required Function() navigationFunction, required String title, IconData? icon, Function()? secondaryFn}){
  bool showSecondaryAction = false;
  if (icon != null && secondaryFn != null) {
    showSecondaryAction = true;
  }

  return Padding(
    padding: const EdgeInsets.only(top: 70.0, left: 20),
    child: SizedBox(
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: navigationFunction,
              child: const Padding(
                padding: EdgeInsets.only(right: 24.0),
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: CustomColors.lightGray,
                  size: 26,
                ),
              )),
          Text(
            title,
            style: CustomTextStyles.gilroyLightTitle.copyWith(fontSize: 22),
          ),
          Expanded(child: Container(),),
          showSecondaryAction ? GestureDetector(
              onTap: secondaryFn,
              child: Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Icon(
                  icon,
                  color: CustomColors.lightGray,
                  size: 26,
                ),
              )) : const SizedBox(width: 30,),
        ],
      ),
    ),
  );
}