import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';

class TabBarController extends BaseController {
  RxInt currentIndex = 0.obs;
  late GlobalKey<NavigatorState> navigatorKey;

  @override
  void onInit() {
    super.onInit();
    navigatorKey = GlobalKey<NavigatorState>();
  }

  String get initialRoute {
    return AppRoutes.home.initial;
  }

  void changeTabIndex(int index) {
    if (currentIndex.value == index) return;

    switch (index) {
      case 0:
        currentIndex(index);
        navigatorKey.currentState?.popAndPushNamed(initialRoute);
        break;
      case 1:
        currentIndex(index);
        navigatorKey.currentState?.popAndPushNamed(AppRoutes.home.favorites);
        break;
    }
  }
}
