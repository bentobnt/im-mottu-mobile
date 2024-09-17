import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';

class DSHeight {
  static DSHeight h_0 = DSHeight._(DSSizesHeights.dsh_0);

  static DSHeight h_1 = DSHeight._(DSSizesHeights.dsh_1);

  static DSHeight h_1_2 = DSHeight._(DSSizesHeights.dsh_1_2);

  static DSHeight h_2 = DSHeight._(DSSizesHeights.dsh_2);

  static DSHeight h_4 = DSHeight._(DSSizesHeights.dsh_4);

  static DSHeight h_8 = DSHeight._(DSSizesHeights.dsh_8);

  static DSHeight h_12 = DSHeight._(DSSizesHeights.dsh_12);

  static DSHeight h_16 = DSHeight._(DSSizesHeights.dsh_16);

  static DSHeight h_20 = DSHeight._(DSSizesHeights.dsh_20);

  static DSHeight h_24 = DSHeight._(DSSizesHeights.dsh_24);

  static DSHeight h_32 = DSHeight._(DSSizesHeights.dsh_32);

  static DSHeight h_48 = DSHeight._(DSSizesHeights.dsh_48);

  static DSHeight h_112 = DSHeight._(DSSizesHeights.dsh_112);

  static DSHeight h_224 = DSHeight._(DSSizesHeights.dsh_224);

  static DSHeight h_336 = DSHeight._(DSSizesHeights.dsh_336);

  final double _baseValue;

  const DSHeight._(this._baseValue);

  double get value => DSHelper.calculateHeight(_baseValue);

  @override
  String toString() => 'DSHeight($_baseValue)';
}
