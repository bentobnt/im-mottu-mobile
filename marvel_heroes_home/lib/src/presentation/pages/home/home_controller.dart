import 'dart:async';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/domain/entities/hero_entity.dart';
import 'package:marvel_heroes_home/src/domain/use_cases/get_heroes_list_use_case.dart';
import 'package:marvel_heroes_home/src/presentation/stores/home_store.dart';

enum OrderByEnum {
  nameDesc('-name', 'Nome Z-A'),
  nameAsc('name', 'Nome A-Z');

  final String value;
  final String desc;

  const OrderByEnum(this.value, this.desc);
}

class HomeController extends BaseController {
  final IGetHeroesListUsecase _getHeroesListUsecase;

  RxBool isLoading = RxBool(true);
  RxBool fetchNewPage = RxBool(false);
  RxBool showError = RxBool(false);
  RxBool showSearchBar = RxBool(false);
  RxList<HeroEntity> heroesListFiltered = RxList.empty();

  int numberOfHeroes = 0;
  int pageNumber = 0;
  int limitPerPage = 10;
  OrderByEnum orderByEnum = OrderByEnum.nameAsc;
  String? searchQuery;
  ScrollController scrollController = ScrollController();
  TextEditingController searchTextFieldController = TextEditingController();
  Timer? debounceTimer;

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
    searchTextFieldController.dispose();
    super.dispose();
  }

  void _loadMore() {
    if (numberOfHeroes > (pageNumber * limitPerPage)) {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        fetchNewPage.value = true;
        pageNumber++;
        getHeroesList();
      }
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
    showError(false);
    int offset = pageNumber * limitPerPage;

    _getHeroesListUsecase(
      offset: offset,
      query: searchQuery,
      order: orderByEnum,
    ).then((response) {
      numberOfHeroes = response.total;
      if (fetchNewPage.value) {
        heroesListFiltered.addAll(response.heroes);
      } else {
        heroesListFiltered.value = response.heroes;
      }
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

  void onTypingFinished(String? query) {
    isLoading(true);

    if (debounceTimer != null) {
      debounceTimer!.cancel();
    }

    debounceTimer = Timer(const Duration(seconds: 1), () {
      pageNumber = 0;
      searchQuery = query;
      orderByEnum = OrderByEnum.nameAsc;
      getHeroesList();
    });
  }

  Future<void> applyOrderFilter() async {
    isLoading(true);
    pageNumber = 0;
    
    await getHeroesList();
  }

  void goToDetailsPage({required HeroEntity selectedHero}) {
    _homeStore.selectedHero = selectedHero;
    Get.toNamed(AppRoutes.home.heroDetails);
  }
}
