import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/presentation/pages/home/home_bindings.dart';
import 'package:marvel_heroes_home/src/presentation/pages/home/home_page.dart';

void main() {
  late GetMaterialApp app;

  setUpAll(() {
    InitialBindings().dependencies();
    HomeBindings().dependencies();

    app = const GetMaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
    );
  });

  testWidgets('Test Widgets', (tester) async {
    await tester.pumpWidget(app);
    await tester.pumpAndSettle();

    expect(find.text('Personagens'), findsOneWidget);
  });
}
