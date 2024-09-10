import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';

class DSIconSize {
  static const DSIconSize large = DSIconSize._(32.0);
  static const DSIconSize medium = DSIconSize._(24.0);
  static const DSIconSize small = DSIconSize._(16.0);

  final double _baseValue;

  const DSIconSize._(this._baseValue);

  double get value => DSHelper.calculateWidth(_baseValue);

  @override
  String toString() => 'DSIconSize($_baseValue)';
}
