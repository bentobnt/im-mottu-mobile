import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/presentation/pages/favorites/favorites_controller.dart';

class FavoritesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => FavoritesController(),
      fenix: true,
    );
  }
}
