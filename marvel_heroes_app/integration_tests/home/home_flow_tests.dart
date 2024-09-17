import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:marvel_heroes/main.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';

import '../base_integration_test.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MainApp app;

  setUpAll(() {
    app = MainApp(initialRoute: AppRoutes.main.splash);
  });

  setUp(() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
  });

  tearDown(() {
    Get.deleteAll(force: true);
  });

  testWidgets('Home Load Heroes List Test', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    await startTest(tester);

    expect(find.text('Personagens'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Favoritos'), findsOneWidget);

    expect(find.byKey(const Key('search_bar_button')), findsOneWidget);
    expect(find.byKey(const Key('scroll_to_bottom_button')), findsOneWidget);
    expect(find.byKey(const Key('scroll_to_top_button')), findsOneWidget);
    expect(find.byKey(const Key('number_of_heroes_text')), findsOneWidget);
    expect(find.byKey(const Key('filter_button')), findsOneWidget);

    try {
      expect(find.byKey(const Key('list_view_widget')), findsOneWidget);
      expect(find.byKey(const Key('card_hero_widget')), findsWidgets);
      expect(find.byKey(const Key('default_error_widget_when_load_heros')),
          findsNothing);
    } catch (_) {
      expect(find.byKey(const Key('default_error_widget_when_load_heros')),
          findsOneWidget);
    }
  });

  testWidgets('Home Empty Heroes List Test', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    await startTest(tester);

    expect(find.text('Personagens'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Favoritos'), findsOneWidget);

    var searchButton = find.byKey(const Key('search_bar_button'));
    expect(searchButton, findsOneWidget);
    await tester.tap(searchButton);
    await tester.pumpAndSettle();

    var searchField = find.byKey(const Key('search_bar_text_field'));
    expect(searchField, findsOneWidget);
    await tester.tap(searchField);
    await tester.enterText(
      searchField,
      '000',
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('number_of_heroes_text')), findsOneWidget);
    expect(find.text('Mostrando 0 de 0 personagens'), findsOneWidget);
    expect(find.byKey(const Key('card_hero_widget')), findsNothing);
  });

  testWidgets('Home Load More Heroes In List Test',
      (WidgetTester tester) async {
    await tester.pumpWidget(app);
    await startTest(tester);

    expect(find.text('Personagens'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Favoritos'), findsOneWidget);

    expect(find.byKey(const Key('search_bar_button')), findsOneWidget);
    expect(find.byKey(const Key('scroll_to_top_button')), findsOneWidget);
    expect(find.byKey(const Key('number_of_heroes_text')), findsOneWidget);
    expect(find.byKey(const Key('filter_button')), findsOneWidget);
    expect(find.byKey(const Key('list_view_widget')), findsOneWidget);

    final scrollBottomButton = find.byKey(const Key('scroll_to_bottom_button'));
    expect(scrollBottomButton, findsOneWidget);

    await tester.tap(scrollBottomButton);
    await tester.pumpAndSettle();

    expect(find.byType(DSLoading), findsOneWidget);
  });

  testWidgets('Home Search Hero Test', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    await startTest(tester);

    expect(find.text('Personagens'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Favoritos'), findsOneWidget);

    var searchButton = find.byKey(const Key('search_bar_button'));
    expect(searchButton, findsOneWidget);
    await tester.tap(searchButton);
    await tester.pumpAndSettle();

    var searchField = find.byKey(const Key('search_bar_text_field'));
    expect(searchField, findsOneWidget);
    await tester.tap(searchField);
    await tester.enterText(
      searchField,
      'captain',
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('number_of_heroes_text')), findsOneWidget);
    expect(find.text('Mostrando 10 de 20 personagens'), findsOneWidget);
    expect(find.byKey(const Key('card_hero_widget')), findsWidgets);
  });

  testWidgets('Home Close Search Button Pressed Test',
      (WidgetTester tester) async {
    await tester.pumpWidget(app);
    await startTest(tester);

    expect(find.text('Personagens'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Favoritos'), findsOneWidget);

    var searchButton = find.byKey(const Key('search_bar_button'));
    expect(searchButton, findsOneWidget);
    await tester.tap(searchButton);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('search_bar_text_field')), findsOneWidget);

    final closeSearchBarButton =
        find.byKey(const Key('close_search_bar_button'));
    expect(closeSearchBarButton, findsOneWidget);
    await tester.tap(closeSearchBarButton);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('number_of_heroes_text')), findsOneWidget);
    expect(find.byKey(const Key('number_of_heroes_text')), findsOneWidget);
    expect(find.byKey(const Key('card_hero_widget')), findsWidgets);
  });

  testWidgets('Home Open Hero Detail  Test', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    await startTest(tester);

    expect(find.text('Personagens'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Favoritos'), findsOneWidget);

    expect(find.byKey(const Key('search_bar_button')), findsOneWidget);
    expect(find.byKey(const Key('scroll_to_bottom_button')), findsOneWidget);
    expect(find.byKey(const Key('scroll_to_top_button')), findsOneWidget);
    expect(find.byKey(const Key('number_of_heroes_text')), findsOneWidget);
    expect(find.byKey(const Key('filter_button')), findsOneWidget);

    expect(find.byKey(const Key('list_view_widget')), findsOneWidget);
    final cards = find.byKey(const Key('card_hero_widget'));
    expect(cards, findsWidgets);
    final firstCard = cards.first;
    expect(firstCard, findsOneWidget);

    await tester.tap(firstCard);
    await tester.pumpAndSettle();

    expect(find.text('Personagens relacionados'), findsOneWidget);
    expect(find.text('Séries'), findsOneWidget);
    expect(find.text('Eventos'), findsOneWidget);
    expect(find.text('Quadrinhos'), findsOneWidget);
    expect(find.byType(CustomTabBarWidget), findsOneWidget);
    final infoButton = find.byKey(const Key('info_button_details'));
    expect(infoButton, findsOneWidget);

    await tester.tap(infoButton);
    await tester.pumpAndSettle();
    expect(find.text('Detalhes'), findsOneWidget);
  });

  testWidgets('Home List With OrderBy Filter Hero Test',
      (WidgetTester tester) async {
    await tester.pumpWidget(app);
    await startTest(tester);

    expect(find.text('Personagens'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Favoritos'), findsOneWidget);

    expect(find.byKey(const Key('search_bar_button')), findsOneWidget);
    expect(find.byKey(const Key('scroll_to_bottom_button')), findsOneWidget);
    expect(find.byKey(const Key('scroll_to_top_button')), findsOneWidget);
    expect(find.byKey(const Key('number_of_heroes_text')), findsOneWidget);
    expect(find.byKey(const Key('card_hero_widget')), findsWidgets);

    final filterButton = find.byKey(const Key('filter_button'));
    expect(filterButton, findsOneWidget);

    await tester.tap(filterButton);
    await tester.pumpAndSettle();

    expect(find.text('Ordenar'), findsOneWidget);
    expect(find.text('Nome A-Z'), findsOneWidget);
    final orderItemByDesc = find.text('Nome Z-A');
    expect(orderItemByDesc, findsOneWidget);

    await tester.tap(orderItemByDesc);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('card_hero_widget')), findsWidgets);
  });

  testWidgets('Home Select Related Hero In Details Page Test',
      (WidgetTester tester) async {
    await tester.pumpWidget(app);
    await startTest(tester);

    expect(find.text('Personagens'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Favoritos'), findsOneWidget);

    expect(find.byKey(const Key('search_bar_button')), findsOneWidget);
    expect(find.byKey(const Key('scroll_to_bottom_button')), findsOneWidget);
    expect(find.byKey(const Key('scroll_to_top_button')), findsOneWidget);
    expect(find.byKey(const Key('number_of_heroes_text')), findsOneWidget);
    expect(find.byKey(const Key('filter_button')), findsOneWidget);

    expect(find.byKey(const Key('list_view_widget')), findsOneWidget);
    final cards = find.byKey(const Key('card_hero_widget'));
    expect(cards, findsWidgets);
    final firstCard = cards.first;
    expect(firstCard, findsOneWidget);

    await tester.tap(firstCard);
    await tester.pumpAndSettle();

    expect(find.text('Personagens relacionados'), findsOneWidget);
    expect(find.text('Séries'), findsOneWidget);
    expect(find.text('Eventos'), findsOneWidget);
    expect(find.text('Quadrinhos'), findsOneWidget);
    expect(find.byType(CustomTabBarWidget), findsOneWidget);
    expect(find.byKey(const Key('info_button_details')), findsOneWidget);

    final relatedCards = find.byKey(const Key('related_hero_card'));
    expect(relatedCards, findsWidgets);
    final firstRelatedCard = relatedCards.first;
    expect(firstRelatedCard, findsOneWidget);

    await tester.dragUntilVisible(
      firstRelatedCard,
      find.byType(ListView),
      const Offset(-250, 0),
    );
    await tester.pumpAndSettle();

    await tester.tap(firstRelatedCard);
    await tester.pumpAndSettle();

    expect(find.text('Personagens relacionados'), findsOneWidget);
    expect(find.text('Séries'), findsOneWidget);
    expect(find.text('Eventos'), findsOneWidget);
    expect(find.text('Quadrinhos'), findsOneWidget);
    expect(find.byType(CustomTabBarWidget), findsOneWidget);
    expect(find.byKey(const Key('info_button_details')), findsOneWidget);
  });

  testWidgets('Home Favorite Hero Test', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    await startTest(tester);

    expect(find.text('Personagens'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    final tabFavorite = find.text('Favoritos');
    expect(tabFavorite, findsOneWidget);

    expect(find.byKey(const Key('search_bar_button')), findsOneWidget);
    expect(find.byKey(const Key('scroll_to_bottom_button')), findsOneWidget);
    expect(find.byKey(const Key('scroll_to_top_button')), findsOneWidget);
    expect(find.byKey(const Key('number_of_heroes_text')), findsOneWidget);
    expect(find.byKey(const Key('filter_button')), findsOneWidget);

    expect(find.byKey(const Key('list_view_widget')), findsOneWidget);
    final favoriteButtons = find.byKey(const Key('favorite_hero_button'));
    expect(favoriteButtons, findsWidgets);
    expect(favoriteButtons.first, findsOneWidget);
    await tester.tap(favoriteButtons.first);
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(milliseconds: 500));

    expect(favoriteButtons.at(1), findsOneWidget);
    await tester.tap(favoriteButtons.at(1));
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(milliseconds: 500));

    expect(favoriteButtons.at(2), findsOneWidget);
    await tester.tap(favoriteButtons.at(2));
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(milliseconds: 500));

    await tester.tap(tabFavorite);
    await tester.pumpAndSettle();

    expect(find.text('Personagens Favoritos'), findsOneWidget);
    expect(find.byKey(const Key('list_of_favorites')), findsOneWidget);

    final favoriteCards = find.byKey(const Key('favorite_card'));
    expect(favoriteCards, findsExactly(3));

    final deleteButtons = find.byKey(const Key('delete_favorite'));
    expect(deleteButtons, findsWidgets);

    await tester.tap(deleteButtons.first);
    await tester.pumpAndSettle();

    expect(find.text('3-D Man'), findsNothing);
  });
}
