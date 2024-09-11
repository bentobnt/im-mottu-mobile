import 'package:flutter/material.dart';

class DSHelper {
  static double calculateWidth(double size) {
    const double reference = 375;

    return (width / reference) * size;
  }

  static double calculateHeight(double size) {
    const double reference = 812;

    return (height / reference) * size;
  }

  static MediaQueryData get mediaQuery =>
      MediaQueryData.fromWindow(WidgetsBinding.instance.window);

  static double get width => mediaQuery.size.width;

  static double get height => mediaQuery.size.height;
}
