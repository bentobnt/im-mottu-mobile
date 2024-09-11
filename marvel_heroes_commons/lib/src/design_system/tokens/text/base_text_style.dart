import 'package:flutter/material.dart';
import 'package:marvel_heroes_commons/src/design_system/design_system.dart';
import 'package:marvel_heroes_commons/src/design_system/tokens/colors/ds_colors.dart';
import 'package:marvel_heroes_commons/src/design_system/tokens/text/text.dart';

class BaseTextStyle extends TextStyle {
  BaseTextStyle({
    FontWeight? fontWeight,
    DSColor? color,
    String? fontFamily,
    double? letterSpacing,
    super.fontSize,
    super.fontStyle = FontStyle.normal,
    super.decoration = TextDecoration.none,
    super.overflow = TextOverflow.visible,
    super.height = 1.2,
  }) : super(
          color: color ?? DSColors.text,
          fontWeight: fontWeight ?? FontWeight.w400,
          package: 'prpass_design_system',
          fontFamily: fontFamily ?? FontFamily.regular.family,
          letterSpacing: letterSpacing ?? 0.0,
        );
}
