import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';

enum DSCircularButtonNavigatorEnum {
  arrowDown,
  arrowUp,
  info;

  DSSvgIconsEnum getIcon() {
    switch (this) {
      case DSCircularButtonNavigatorEnum.arrowUp:
        return DSSvgIconsEnum.arrowUp;
      case DSCircularButtonNavigatorEnum.arrowDown:
        return DSSvgIconsEnum.arrowDown;
      case DSCircularButtonNavigatorEnum.info:
        return DSSvgIconsEnum.info;
    }
  }
}
