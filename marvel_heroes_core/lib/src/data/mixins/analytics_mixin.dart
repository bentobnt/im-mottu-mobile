import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_core/src/core/libs/lib_dependencies.dart';

mixin AnalyticsMixin {
  final int limitLength = 100;

  void logEvent({
    required String name,
    Map<String, String>? extraParameters,
  }) {
    extraParameters?.removeWhere((key, value) => value == '');
    extraParameters?.forEach((key, value) {
      if (value.length > limitLength) {
        throw Exception(
          'Parâmetro [$key] -> [$value] ultrapassou o limite de $limitLength caracteres',
        );
      }
    });

    FirebaseAnalytics.instance
        .logEvent(name: name, parameters: extraParameters);
    Log.info('analyitcs logEvent: $name : $extraParameters');
  }

  void logScreen({
    required String screen,
    Map<String, String>? extraParameters,
  }) {
    extraParameters?.removeWhere((key, value) => value == '');
    extraParameters?.forEach((key, value) {
      if (value.length > limitLength) {
        throw Exception(
          'Parâmetro [$key] -> [$value] ultrapassou o limite de $limitLength caracteres',
        );
      }
    });

    FirebaseAnalytics.instance
        .logScreenView(screenName: screen, parameters: extraParameters);
    Log.info('analyitcs logScreen: $screen : $extraParameters');
  }
}
