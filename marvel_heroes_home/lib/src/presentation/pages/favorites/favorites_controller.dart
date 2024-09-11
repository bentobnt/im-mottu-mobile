import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';

class FavoritesController extends BaseController {
  RxBool isLoading = RxBool(true);
  RxBool showError = RxBool(false);

  FavoritesController();

  @override
  void onInit() {
    super.onInit();
  }
}
