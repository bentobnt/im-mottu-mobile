import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_commons/src/design_system/tokens/sizes/ds_button_heigth_size.dart';
import 'package:marvel_heroes_commons/src/design_system/tokens/sizes/ds_button_width_size.dart';

enum DSButtonSizeEnum {
  small,
  medium,
  big;

  DSButtonHeight buttonHeight() {
    switch (this) {
      case DSButtonSizeEnum.small:
        return DSButtonHeight.small;
      case DSButtonSizeEnum.medium:
        return DSButtonHeight.medium;
      case DSButtonSizeEnum.big:
        return DSButtonHeight.big;
    }
  }

  DSButtonWidth buttonWidht() {
    switch (this) {
      case DSButtonSizeEnum.small:
        return DSButtonWidth.small;
      case DSButtonSizeEnum.medium:
        return DSButtonWidth.medium;
      case DSButtonSizeEnum.big:
        return DSButtonWidth.big;
    }
  }

  DSTextStyle getTextStyle() {
    switch (this) {
      case DSButtonSizeEnum.small:
        return DSTextStyle.buttonSmall;
      case DSButtonSizeEnum.medium:
        return DSTextStyle.buttonMedium;
      case DSButtonSizeEnum.big:
        return DSTextStyle.buttonMedium;
    }
  }
}
