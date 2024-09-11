import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';

class HeroDetailsController extends BaseController {
  RxBool isLoading = RxBool(true);
  RxBool showError = RxBool(false);

  HeroDetailsController();

  @override
  void onInit() {
    super.onInit();
  }
}
