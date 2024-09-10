import 'package:marvel_heroes_commons/src/design_system/design_system.dart';
import 'package:marvel_heroes_commons/src/design_system/sizes/ds_sizes_width.dart';

class DSFontSize {
  static DSFontSize font_32 = DSFontSize._(DSSizesWidths.dsw_32);
  static DSFontSize font_24 = DSFontSize._(DSSizesWidths.dsw_24);
  static DSFontSize font_20 = DSFontSize._(DSSizesWidths.dsw_20);
  static DSFontSize font_16 = DSFontSize._(DSSizesWidths.dsw_16);
  static DSFontSize font_12 = DSFontSize._(DSSizesWidths.dsw_12);
  static DSFontSize font_8 = DSFontSize._(DSSizesWidths.dsw_8);

  final double _baseValue;

  const DSFontSize._(this._baseValue);

  double get value => DSHelper.calculateWidth(_baseValue);
}
