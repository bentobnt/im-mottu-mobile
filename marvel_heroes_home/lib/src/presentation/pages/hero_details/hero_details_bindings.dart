import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/presentation/pages/hero_details/hero_details_controller.dart';

class HeroDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HeroDetailsController(),
      fenix: true,
    );
  }
}
