import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/domain/entities/hero_entity.dart';
import 'package:marvel_heroes_home/src/domain/entities/heroes_response_entity.dart';
import 'package:marvel_heroes_home/src/domain/use_cases/get_heroes_list_use_case.dart';

class HomeController extends BaseController {
  final IGetHeroesListUsecase _getHeroesListUsecase;

  RxBool isLoading = RxBool(true);
  RxBool showError = RxBool(false);

  late List<HeroEntity> heroesList;

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
      _setupHeroesListWithResponse(response);
    }).onError((error, stackTrace) {
      showError(true);
    }).whenComplete(
      () => isLoading(false),
    );
  }

  void _setupHeroesListWithResponse(HeroesResponseEntity response) {
    heroesList = response.heroes;
  }
}
