import 'package:marvel_heroes/src/bindings/app_bindings.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';

class SplashController extends GetxController {
  Future<void> initialConfiguration() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Get.deleteAll(force: true);
      AppBinding().dependencies();

      await Future.delayed(const Duration(seconds: 2));
      Get.offAllNamed(AppRoutes.main.tabbar);
    });
  }
}
