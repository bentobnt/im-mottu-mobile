
import '../../../../marvel_heroes_commons.dart';

class DsWidth {
  static DsWidth w_0 = DsWidth._(DSSizesWidths.dsw_0);

  static DsWidth w_0_1 = DsWidth._(DSSizesWidths.dsw_0_1);

  static DsWidth w_0_15 = DsWidth._(DSSizesWidths.dsw_0_15);

  static DsWidth w_0_25 = DsWidth._(DSSizesWidths.dsw_0_25);

  static DsWidth w_0_5 = DsWidth._(DSSizesWidths.dsw_0_5);

  static DsWidth w_1 = DsWidth._(DSSizesWidths.dsw_1);

  static DsWidth w_2 = DsWidth._(DSSizesWidths.dsw_2);

  static DsWidth w_4 = DsWidth._(DSSizesWidths.dsw_4);

  static DsWidth w_8 = DsWidth._(DSSizesWidths.dsw_8);

  static DsWidth w_12 = DsWidth._(DSSizesWidths.dsw_12);

  static DsWidth w_16 = DsWidth._(DSSizesWidths.dsw_16);

  static DsWidth w_20 = DsWidth._(DSSizesWidths.dsw_20);

  static DsWidth w_24 = DsWidth._(DSSizesWidths.dsw_24);

  static DsWidth w_32 = DsWidth._(DSSizesWidths.dsw_32);

  static DsWidth w_48 = DsWidth._(DSSizesWidths.dsw_48);

  static DsWidth w_112 = DsWidth._(DSSizesWidths.dsw_112);

  static DsWidth w_224 = DsWidth._(DSSizesWidths.dsw_224);

  static DsWidth w_336 = DsWidth._(DSSizesWidths.dsw_336);

  final double _baseValue;

  const DsWidth._(this._baseValue);

  double get value => DSHelper.calculateWidth(_baseValue);

  @override
  String toString() => 'DsWidth($_baseValue)';
}
