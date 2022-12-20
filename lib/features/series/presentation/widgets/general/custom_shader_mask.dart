import 'package:flutter/material.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';

Widget customShaderMask({required Widget child, required double bottomFade}) {
  return ShaderMask(
    shaderCallback: (rect) {
      return const LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        stops: [0.9,1],
        colors: [CustomColors.softBlack, CustomColors.transparent],
      ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
    },
    blendMode: BlendMode.dstIn,
    child: ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.9,1],
          colors: [CustomColors.softBlack, CustomColors.transparent],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: ShaderMask(
        shaderCallback: (rect) {
          return const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.9,1],
            colors: [CustomColors.softBlack, CustomColors.transparent],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [bottomFade,1],
              colors: const [CustomColors.softBlack, CustomColors.transparent],
            ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
          },
          blendMode: BlendMode.dstIn,
          child: child,
        ),
      ),
    ),
  );
}