import 'package:flutter/material.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';

enum DSPngImagesEnum { logo, error, noInformation, loading }

class DSImages {
  static const _images = {
    DSPngImagesEnum.logo: 'assets/images/logo.png',
    DSPngImagesEnum.error: 'assets/images/error.png',
    DSPngImagesEnum.noInformation: 'assets/images/no-information.png',
    DSPngImagesEnum.loading: 'assets/images/shield-loading.gif',
  };

  static Image getImage(DSPngImagesEnum type,
      {double? size, BoxFit? fit, DSColor? color}) {
    return Image.asset(
      _images[type] ?? '',
      width: size ?? DsWidth.w_24.value,
      height: size ?? DSHeight.h_24.value,
      package: 'marvel_heroes_commons',
      fit: fit ?? BoxFit.fitWidth,
      color: color,
    );
  }
}
