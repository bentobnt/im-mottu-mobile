import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';

enum DSCircularButtonNavigatorEnum {
  arrowRight,
  arrowLeft;

  DSSvgIconsEnum getIcon() {
    switch (this) {
      case DSCircularButtonNavigatorEnum.arrowRight:
        return DSSvgIconsEnum.search;
      case DSCircularButtonNavigatorEnum.arrowLeft:
        return DSSvgIconsEnum.search;
    }
  }
}
