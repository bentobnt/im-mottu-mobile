import '../../helpers/helpers.dart';
import 'ds_sizes_width.dart';

class DSButtonWidth {
  static DSButtonWidth small = DSButtonWidth._(DSSizesWidths.dsw_112);
  static DSButtonWidth medium = DSButtonWidth._(DSSizesWidths.dsw_224);
  static DSButtonWidth big = DSButtonWidth._(DSSizesWidths.dsw_336);

  final double _baseValue;

  const DSButtonWidth._(this._baseValue);

  double get value => DSHelper.calculateWidth(_baseValue);

  @override
  String toString() => 'DSButtonWidth($_baseValue)';
}
