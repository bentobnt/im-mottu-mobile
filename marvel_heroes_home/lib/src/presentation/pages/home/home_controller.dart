import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/domain/entities/hero_entity.dart';
import 'package:marvel_heroes_home/src/domain/use_cases/get_heroes_list_use_case.dart';
import 'package:marvel_heroes_home/src/presentation/stores/home_store.dart';

class HomeController extends BaseController {
  final IGetHeroesListUsecase _getHeroesListUsecase;

  RxBool isLoading = RxBool(true);
  RxBool fetchNewPage = RxBool(false);
  RxBool showError = RxBool(false);
  RxBool showSearchBar = RxBool(false);

  List<HeroEntity> _heroesList = List.empty();
  final RxList<HeroEntity> heroesListFiltered = RxList.empty();

  int numberOfHeroes = 0;
  int pageNumber = 0;
  int limitPerPage = 100;
  final scrollController = ScrollController();

  final HomeStore _homeStore;

  HomeController({
    required IGetHeroesListUsecase getHeroesListUsecase,
    required HomeStore homeStore,
  })  : _getHeroesListUsecase = getHeroesListUsecase,
        _homeStore = homeStore;

  RxList<String> get listHeroesIds => _homeStore.favoritesHeroesIds;

  @override
  void onInit() async {
    super.onInit();
    scrollController.addListener(_loadMore);

    await _fetchFavorites();
    getHeroesList();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _loadMore() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      fetchNewPage.value = true;
      pageNumber++;
      getHeroesList();
    }
  }

  Future<void> _fetchFavorites() async {
    try {
      final pref = await SharedPreferences.getInstance();
      List<String> savedList = pref.getStringList('favorites_heroes_ids') ?? [];
      _homeStore.favoritesHeroesIds.value = savedList;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void handleFavoriteButton({required bool add, required int heroId}) async {
    try {
      add
          ? _homeStore.favoritesHeroesIds.add(heroId.toString())
          : _homeStore.favoritesHeroesIds
              .removeWhere((id) => id == heroId.toString());

      List<String> stringList = _homeStore.favoritesHeroesIds
          .map((element) => element.toString())
          .toList();
      final pref = await SharedPreferences.getInstance();

      await pref.setStringList('favorites_heroes_ids', stringList);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getHeroesList() async {
    int offset = pageNumber * limitPerPage;
    _getHeroesListUsecase(offset: offset).then((response) {
      _heroesList += response.heroes;
      numberOfHeroes = response.total;
      heroesListFiltered.addAll(response.heroes);
    }).onError((error, stackTrace) {
      showError(true);
    }).whenComplete(() {
      isLoading(false);
      fetchNewPage(false);
    });
  }

  void scrollToBottom(bool bottom) {
    if (bottom) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent - 200);
    } else {
      scrollController.jumpTo(0);
    }
  }

  void search(String query) {
    heroesListFiltered.clear();
    if (query.isEmpty) {
      heroesListFiltered.addAll(_heroesList);
    } else {
      var filtered = _heroesList.where((hero) {
        if (hero.name != null) {
          return hero.name!.toLowerCase().contains(query.toLowerCase());
        }
        return false;
      }).toList();
      heroesListFiltered.addAll(filtered);
    }
  }

  void goToDetailsPage({required HeroEntity selectedHero}) {
    _homeStore.selectedHero = selectedHero;
    Get.toNamed(AppRoutes.home.heroDetails);
  }
}
