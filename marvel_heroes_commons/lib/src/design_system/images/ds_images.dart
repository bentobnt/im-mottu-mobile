import 'package:flutter/material.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';

enum DSPngImagesEnum { heroes, ironMan }

class DSImages {
  static const _images = {
    DSPngImagesEnum.heroes: 'assets/images/heroes.png',
    DSPngImagesEnum.ironMan: 'assets/images/iron-man.png',
  };

  static Image getImage(DSPngImagesEnum type, {double? size, BoxFit? fit}) {
    return Image.asset(
      _images[type] ?? '',
      width: size ?? DSHeight.h_24.value,
      height: size ?? DSHeight.h_24.value,
      package: 'marvel_heroes_commons',
      fit: fit ?? BoxFit.fitWidth,
    );
  }
}
