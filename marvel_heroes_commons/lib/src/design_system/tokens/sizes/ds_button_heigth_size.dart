import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';

class DSButtonHeight {
  static DSButtonHeight small = DSButtonHeight._(DSSizesHeights.dsh_24);
  static DSButtonHeight medium = DSButtonHeight._(DSSizesHeights.dsh_32);
  static DSButtonHeight big = DSButtonHeight._(DSSizesHeights.dsh_48);

  final double _baseValue;

  const DSButtonHeight._(this._baseValue);

  double get value => DSHelper.calculateHeight(_baseValue);
}
