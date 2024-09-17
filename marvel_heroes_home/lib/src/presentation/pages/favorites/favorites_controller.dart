import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/domain/entities/hero_entity.dart';
import 'package:marvel_heroes_home/src/domain/entities/heroes_response_entity.dart';
import 'package:marvel_heroes_home/src/domain/use_cases/get_heroes_list_use_case.dart';
import 'package:marvel_heroes_home/src/presentation/stores/home_store.dart';

class FavoritesController extends BaseController {
  final IGetHeroesListUsecase _getHeroesListUsecase;

  RxBool isLoading = RxBool(true);
  RxBool showError = RxBool(false);

  final scrollController = ScrollController();

  List<String> favoritesListIds = [];
  final RxList<HeroEntity> heroesList = RxList.empty();

  final HomeStore _homeStore;

  FavoritesController({
    required HomeStore homeStore,
    required IGetHeroesListUsecase getHeroesListUsecase,
  })  : _homeStore = homeStore,
        _getHeroesListUsecase = getHeroesListUsecase;

  @override
  void onInit() {
    super.onInit();
    fetchFavorites();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchFavorites() async {
    isLoading(true);
    try {
      List<String> stringList =
          _homeStore.favoritesHeroesIds.map((item) => item.toString()).toList();
      favoritesListIds = stringList;
      _loadHeroesList();
    } catch (e) {
      showError(true);
      Log.error(e.toString());
    }
  }

  Future<void> _loadHeroesList() async {
    if (favoritesListIds.isEmpty) {
      isLoading(false);
    }
    for (var id in favoritesListIds) {
      isLoading(true);
      try {
        final intId = int.parse(id);
        HeroesResponseEntity response =
            await _getHeroesListUsecase.call(id: intId);
        heroesList.add(response.heroes.first);
      } catch (e) {
        showError(true);
        Log.error(e.toString());
      } finally {
        isLoading(false);
      }
    }
  }

  void deleteHero(HeroEntity hero) async {
    final pref = await SharedPreferences.getInstance();
    favoritesListIds = pref.getStringList('favorites_heroes_ids') ?? [];
    favoritesListIds.removeWhere((id) => id == hero.id.toString());
    pref.setStringList('favorites_heroes_ids', favoritesListIds);
    heroesList.remove(hero);
    _homeStore.favoritesHeroesIds.value = favoritesListIds;
  }

  void goToDetailsPage({required HeroEntity selectedHero}) {
    _homeStore.selectedHero = selectedHero;
    Get.toNamed(AppRoutes.home.heroDetails);
  }
}
