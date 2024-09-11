import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';

enum DSSvgIconsEnum { favorite, home, search, close, arrowDown, arrowUp }

abstract class DSSvgIcons {
  static const _icons = {
    DSSvgIconsEnum.favorite: 'assets/svg/favorite.svg',
    DSSvgIconsEnum.home: 'assets/svg/home.svg',
    DSSvgIconsEnum.search: 'assets/svg/search.svg',
    DSSvgIconsEnum.close: 'assets/svg/close.svg',
    DSSvgIconsEnum.arrowDown: 'assets/svg/arrow_down.svg',
    DSSvgIconsEnum.arrowUp: 'assets/svg/arrow_up.svg',
  };

  static SvgPicture getIcon(DSSvgIconsEnum type,
      {DSColor? color, DSIconSize? size}) {
    return SvgPicture.asset(
      _icons[type] ?? '',
      color: color ?? DSColors.white,
      height: size?.value ?? DSIconSize.medium.value,
      width: size?.value ?? DSIconSize.medium.value,
      package: 'marvel_heroes_commons',
      fit: BoxFit.scaleDown,
    );
  }
}
