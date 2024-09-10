import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'tab_bar_controller.dart';

class TabBarBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => TabBarController(),
      fenix: true,
    );
  }
}
