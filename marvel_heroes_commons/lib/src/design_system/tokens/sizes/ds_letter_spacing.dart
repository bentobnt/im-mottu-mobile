import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';

class DSLetterSpacing {
  static DSLetterSpacing ls_0_1 = DSLetterSpacing._(DSSizesWidths.dsw_0_1);
  static DSLetterSpacing ls_0_5 = DSLetterSpacing._(DSSizesWidths.dsw_0_5);
  static DSLetterSpacing ls_0_15 = DSLetterSpacing._(DSSizesWidths.dsw_0_15);
  static DSLetterSpacing ls_0_25 = DSLetterSpacing._(DSSizesWidths.dsw_0_25);

  final double _baseValue;

  const DSLetterSpacing._(this._baseValue);

  double get value => DSHelper.calculateWidth(_baseValue);

  @override
  String toString() => 'DSLetterSpacing($_baseValue)';
}
