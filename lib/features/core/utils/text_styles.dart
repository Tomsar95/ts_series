import 'package:flutter/material.dart';
import 'package:tv_series/features/core/utils/general_colors.dart';


class CustomTextStyles {
  static const TextStyle _baseFont = TextStyle(
    color: GeneralColors.white,
    fontWeight: FontWeight.w400,
    fontFamily: 'Gilroy',
    fontStyle: FontStyle.normal,
    fontSize: 13,
  );

  static TextStyle gilroyLightTitle = _baseFont.copyWith(fontSize: 24);
  static TextStyle gilroyLight = _baseFont.copyWith(fontSize: 18);

  static const TextStyle gilroyHint = TextStyle(
  color: GeneralColors.darkGray,
  fontWeight: FontWeight.w400,
  fontFamily: 'Gilroy',
  fontStyle: FontStyle.normal,
  fontSize: 18,
  );

  static TextStyle gilroyBoldTitle = _baseFont.copyWith(fontWeight: FontWeight.w500,fontSize: 24);
  static TextStyle gilroyBold = _baseFont.copyWith(fontWeight: FontWeight.w500,fontSize: 18);
}