import 'package:flutter/material.dart';
import 'package:marvel_heroes_commons/src/design_system/tokens/sizes/sizes.dart';
import 'package:marvel_heroes_commons/src/design_system/tokens/text/text.dart';

class DSTextStyle extends BaseTextStyle {
  static final heading = DSTextStyle._title();
  static final subtitle = DSTextStyle._subtitle1();

  static final body = DSTextStyle._bodyMedium();
  static final body2 = DSTextStyle._bodyRegular();

  static final footnote = DSTextStyle._footnoteLight();
  static final footnote2 = DSTextStyle._footnoteThin();

  // buttons
  static final buttonBig = DSTextStyle._buttonBig();
  static final buttonMedium = DSTextStyle._buttonMedium();
  static final buttonSmall = DSTextStyle._buttonSmall();

  DSTextStyle._title()
      : super(
          fontFamily: FontFamily.bold.family,
          fontSize: DSFontSize.font_32.value,
          height: DSHeight.h_1.value,
          letterSpacing: DSLetterSpacing.ls_0_1.value,
        );

  DSTextStyle._subtitle1()
      : super(
          fontFamily: FontFamily.semiBold.family,
          fontSize: DSFontSize.font_24.value,
          height: DSHeight.h_1_2.value,
          letterSpacing: DSLetterSpacing.ls_0_15.value,
          fontWeight: FontWeight.w400,
        );

  DSTextStyle._bodyMedium()
      : super(
          fontFamily: FontFamily.medium.family,
          fontSize: DSFontSize.font_16.value,
          height: DSHeight.h_1_2.value,
          letterSpacing: DSLetterSpacing.ls_0_5.value,
          fontWeight: FontWeight.w400,
        );

  DSTextStyle._bodyRegular()
      : super(
          fontFamily: FontFamily.regular.family,
          fontSize: DSFontSize.font_12.value,
          height: DSHeight.h_1_2.value,
          letterSpacing: DSLetterSpacing.ls_0_25.value,
          fontWeight: FontWeight.w400,
        );

  DSTextStyle._footnoteLight()
      : super(
          fontFamily: FontFamily.regular.family,
          fontSize: DSFontSize.font_12.value,
          height: DSHeight.h_1_2.value,
          letterSpacing: DSLetterSpacing.ls_0_25.value,
          fontWeight: FontWeight.w400,
        );

  DSTextStyle._footnoteThin()
      : super(
          fontFamily: FontFamily.regular.family,
          fontSize: DSFontSize.font_8.value,
          height: DSHeight.h_1_2.value,
          letterSpacing: DSLetterSpacing.ls_0_25.value,
          fontWeight: FontWeight.w400,
        );

  // Buttons
  DSTextStyle._buttonBig()
      : super(
          fontFamily: FontFamily.regular.family,
          fontSize: DSFontSize.font_20.value,
          height: DSHeight.h_1_2.value,
          letterSpacing: DSLetterSpacing.ls_0_5.value,
          fontWeight: FontWeight.w700,
        );

  DSTextStyle._buttonMedium()
      : super(
          fontFamily: FontFamily.regular.family,
          fontSize: DSFontSize.font_16.value,
          height: DSHeight.h_1_2.value,
          letterSpacing: DSLetterSpacing.ls_0_5.value,
          fontWeight: FontWeight.w700,
        );

  DSTextStyle._buttonSmall()
      : super(
          fontFamily: FontFamily.regular.family,
          fontSize: DSFontSize.font_12.value,
          height: DSHeight.h_1_2.value,
          letterSpacing: DSLetterSpacing.ls_0_5.value,
          fontWeight: FontWeight.w400,
        );

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DSTextStyle(\nfontFamily: $fontFamily,\n fontSize: $fontSize,\n height: $height,\n letterSpacing: $letterSpacing,\n fontWeight: $fontWeight\n)';
  }
}
