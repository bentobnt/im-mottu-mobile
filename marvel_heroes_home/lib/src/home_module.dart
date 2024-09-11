import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_home/src/presentation/pages/favorites/favorites_page.dart';
import 'package:marvel_heroes_home/src/presentation/pages/hero_details/hero_details_bindings.dart';
import 'package:marvel_heroes_home/src/presentation/pages/hero_details/hero_details_page.dart';
import 'package:marvel_heroes_home/src/presentation/pages/home/home_bindings.dart';
import 'package:marvel_heroes_home/src/presentation/pages/home/home_page.dart';

import 'presentation/pages/favorites/favorites_bindings.dart';

abstract class HomeModule {
  static List<GetPage> routes = [
    GetPage(
      name: AppRoutes.home.favorites,
      page: () => const FavoritesPage(),
      binding: FavoritesBindings(),
    ),
    GetPage(
      name: AppRoutes.home.heroDetails,
      page: () => const HeroDetailsPage(),
      binding: HeroDetailsBindings(),
    ),
    GetPage(
      name: AppRoutes.home.initial,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
  ];
}
