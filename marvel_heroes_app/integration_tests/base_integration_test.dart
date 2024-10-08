import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';

Future<void> startTest(WidgetTester tester) async {
  await tester.pumpAndSettle(const Duration(seconds: 2));
  await tester.pumpAndSettle();

  while (Get.currentRoute == AppRoutes.main.splash) {
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.pumpAndSettle();
  }
}
