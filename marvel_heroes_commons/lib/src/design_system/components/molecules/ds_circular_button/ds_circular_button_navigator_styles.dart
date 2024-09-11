import 'package:marvel_heroes_commons/src/design_system/tokens/colors/ds_colors.dart';

abstract class DSCircularButtonNavigatorStyles {
  static DSColor getBackgroundColor(bool isActive) {
    return isActive ? DSColors.primary : DSColors.transparent;
  }

  static DSColor getBorderColor(bool isActive) {
    return isActive ? DSColors.primary : DSColors.transparent;
  }

  static DSColor getIconColor(bool isActive) {
    return isActive ? DSColors.primary : DSColors.transparent;
  }
}
