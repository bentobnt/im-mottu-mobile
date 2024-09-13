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
  RxList<int> favoritesHeroesIds = RxList.empty();
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

  @override
  void onInit() async {
    super.onInit();
    scrollController.addListener(_loadMore);
    await _fetchFavorites();
    _getHeroesList(0);
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
      _getHeroesList(scrollController.position.pixels);
    }
  }

  Future<void> _fetchFavorites() async {
    try {
      final localStorage = Get.find<ILocalStorageUseCase>();
      favoritesHeroesIds.value =
          await localStorage.get('favorites_heroes_ids') ?? [];
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void handleFavoriteButton({required bool add, required int heroId}) async {
    try {
      add
          ? favoritesHeroesIds.add(heroId)
          : favoritesHeroesIds.removeWhere((id) => id == heroId);

      final localStorage = Get.find<ILocalStorageUseCase>();
      await localStorage.set('favorites_heroes_ids', favoritesHeroesIds.value);
      print(await localStorage.get('favorites_heroes_ids'));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _getHeroesList(double? jumpToScrollPosition) async {
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
