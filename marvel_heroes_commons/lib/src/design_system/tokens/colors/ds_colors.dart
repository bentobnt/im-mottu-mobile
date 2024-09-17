import 'package:flutter/material.dart';

class DSColor extends Color {
  const DSColor(super.value);

  const DSColor.fromARGB(super.a, super.r, super.g, super.b) : super.fromARGB();

  const DSColor.fromRGBO(super.r, super.g, super.b, super.opacity)
      : super.fromRGBO();

  @override
  DSColor withOpacity(double opacity) {
    assert(opacity >= 0.0 && opacity <= 1.0);
    return withAlpha((255.0 * opacity).round());
  }

  @override
  DSColor withAlpha(int a) {
    return DSColor.fromARGB(a, red, green, blue);
  }
}

abstract class DSColors {
  static const DSColor primary = DSColor(0XFFE23636);
  static const DSColor primaryDesactivated = DSColor(0XFFF5A3A3);
  static const DSColor secondary = DSColor(0XFF1A2A6A);
  static const DSColor secondaryDesactivated = DSColor(0XFF4D5C96);
  static const DSColor tertiary = DSColor(0XFFF5C300);
  static const DSColor tertiaryDesactivated = DSColor(0XFFFBE28C);

  static const DSColor divider = DSColor(0XFFD8D8D8);
  static const DSColor background = DSColor(0XFFF0F0F5);
  static const DSColor text = DSColor(0XFF333333);

  static const DSColor success = DSColor(0XFF3C9F40);

  static const DSColor black = DSColor(0XFF000000);
  static const DSColor white = DSColor(0XFFFFFFFF);
  static const DSColor transparent = DSColor(0x00000000);
}
