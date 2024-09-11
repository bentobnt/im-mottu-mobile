import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/domain/entities/hero_entity.dart';
import 'package:marvel_heroes_home/src/domain/use_cases/get_heroes_list_use_case.dart';

class HomeController extends BaseController {
  final IGetHeroesListUsecase _getHeroesListUsecase;

  RxBool isLoading = RxBool(true);
  RxBool showError = RxBool(false);
  RxBool showSearchBar = RxBool(false);

  List<HeroEntity> _heroesList = List.empty();
  final RxList<HeroEntity> heroesListFiltered = RxList.empty();

  HomeController({
    required IGetHeroesListUsecase getHeroesListUsecase,
  }) : _getHeroesListUsecase = getHeroesListUsecase;

  @override
  void onInit() {
    super.onInit();
    _getHeroesList();
  }

  Future<void> _getHeroesList() async {
    _getHeroesListUsecase().then((response) {
      _heroesList = response.heroes;
      heroesListFiltered.addAll(response.heroes);
    }).onError((error, stackTrace) {
      showError(true);
    }).whenComplete(
      () => isLoading(false),
    );
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
}
