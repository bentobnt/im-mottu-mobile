import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/domain/entities/hero_entity.dart';
import 'package:marvel_heroes_home/src/domain/use_cases/get_heroes_list_use_case.dart';

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
  final scrollController = ScrollController();

  HomeController({
    required IGetHeroesListUsecase getHeroesListUsecase,
  }) : _getHeroesListUsecase = getHeroesListUsecase;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_loadMore);
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

  void scrollToBottom(bool bottom) {
    if (bottom) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent - 200);
    } else {
      scrollController.jumpTo(0);
    }
  }

  Future<void> _getHeroesList(double? jumpToScrollPosition) async {
    int offset = pageNumber * 20;
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

  void search(String query) {
    heroesListFiltered.clear();
    if (query.isEmpty) {
      heroesListFiltered.addAll(_heroesList);
    } else {
      var filtered = _heroesList.where((hero) {
        return hero.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      heroesListFiltered.addAll(filtered);
    }
  }

  void goToDetailsPage() {
    Get.toNamed(AppRoutes.home.heroDetails);
  }
}
