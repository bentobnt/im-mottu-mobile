import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_home/src/presentation/pages/home/home_bindings.dart';
import 'package:marvel_heroes_home/src/presentation/pages/home/home_page.dart';

abstract class HomeModule {
  static List<GetPage> routes = [
    GetPage(
      name: AppRoutes.home.initial,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
  ];
}
