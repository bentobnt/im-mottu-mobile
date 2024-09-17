import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';

enum DSLoadingSizeEnum {
  small,
  medium,
  big;

  DSHeight loadingSize() {
    switch (this) {
      case DSLoadingSizeEnum.small:
        return DSHeight.h_32;
      case DSLoadingSizeEnum.medium:
        return DSHeight.h_48;
      case DSLoadingSizeEnum.big:
        return DSHeight.h_112;
    }
  }
}
