import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';

class FavoritesController extends BaseController {
  RxBool isLoading = RxBool(true);
  RxBool showError = RxBool(false);

  List<int> favoritesList = [];

  FavoritesController();

  @override
  void onInit() async {
    super.onInit();

    await _fetchFavorites();
  }

  Future<void> _fetchFavorites() async {
    try {
      final localStorage = Get.find<ILocalStorageUseCase>();
      favoritesList = await localStorage.get('favorites_heroes_ids') ?? [];
    } catch (e) {
      showError(true);
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
