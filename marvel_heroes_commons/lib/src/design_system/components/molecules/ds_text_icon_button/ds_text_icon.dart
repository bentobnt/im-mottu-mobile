import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';

enum DSTextIconEnum {
  small,
  medium,
  big;

  DSTextStyle getTextStyle() {
    switch (this) {
      case DSTextIconEnum.small:
        return DSTextStyle.buttonSmall;
      case DSTextIconEnum.medium:
        return DSTextStyle.buttonMedium;
      case DSTextIconEnum.big:
        return DSTextStyle.buttonBig;
    }
  }

  DSIconSize getSizeIcon() {
    switch (this) {
      case DSTextIconEnum.small:
        return DSIconSize.small;
      case DSTextIconEnum.medium:
        return DSIconSize.medium;
      case DSTextIconEnum.big:
        return DSIconSize.large;
    }
  }
}
