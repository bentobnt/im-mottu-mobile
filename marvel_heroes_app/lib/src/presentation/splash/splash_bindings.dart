import 'splash_controller.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashController(),
      fenix: true,
    );
  }
}
