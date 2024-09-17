import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/domain/entities/hero_entity.dart';
import 'package:marvel_heroes_home/src/domain/entities/heroes_response_entity.dart';
import 'package:marvel_heroes_home/src/domain/use_cases/get_hero_detail_by_type_use_case.dart';
import 'package:marvel_heroes_home/src/domain/use_cases/get_related_heroes_use_case.dart';
import 'package:marvel_heroes_home/src/presentation/pages/hero_details/widgets/comics_tab_widget.dart';
import 'package:marvel_heroes_home/src/presentation/pages/hero_details/widgets/series_tab_widget.dart';
import 'package:marvel_heroes_home/src/presentation/stores/home_store.dart';

class HeroDetailsController extends BaseController
    with GetTickerProviderStateMixin {
  RxBool isLoading = RxBool(true);
  RxBool isLoadingRelatedHeroes = RxBool(true);
  RxBool showError = RxBool(false);
  RxInt tabIndex = RxInt(0);

  late TabController tabController;
  List<String> tabHeaderTitles = [];
  List<Widget> tabContent = [];

  final HomeStore _homeStore;
  HeroEntity? selectedHero;

  HeroesResponseEntity? series;
  HeroesResponseEntity? events;
  HeroesResponseEntity? comics;
  List<int> comicsIds = [];
  List<HeroEntity> relatedHeroes = [];

  final IGetHeroeDetailByTypeUsecase _getHeroeDetailByTypeUsecase;
  final IGetRelatedHeroesUsecase _getRelatedHeroesUsecase;

  HeroDetailsController({
    required HomeStore homeStore,
    required IGetHeroeDetailByTypeUsecase getHeroDetailByTypeUseCase,
    required IGetRelatedHeroesUsecase getRelatedHeroesUsecase,
  })  : _homeStore = homeStore,
        _getHeroeDetailByTypeUsecase = getHeroDetailByTypeUseCase,
        _getRelatedHeroesUsecase = getRelatedHeroesUsecase;

  @override
  void onInit() {
    super.onInit();
    loadHeroDetails();
  }

  @override
  void onClose() {
    tabController.removeListener(_changeTabListener);
    tabController.dispose();
    super.onClose();
  }

  Future<void> loadHeroDetails() async {
    isLoading(true);
    try {
      if (_homeStore.selectedHero != null) {
        selectedHero = _homeStore.selectedHero!;
      }

      series = await _fetchTabItemWhenSelected(type: DetailTypeEnum.series);
      events = await _fetchTabItemWhenSelected(type: DetailTypeEnum.events);
      comics = await _fetchTabItemWhenSelected(type: DetailTypeEnum.comics);

      _setupComicsList();
      _setupTabs();
      _setupTabBar();
    } catch (e) {
      showError(true);
      Log.error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void _setupComicsList() {
    comics?.heroes.map((value) {
      comicsIds.add(value.id);
    }).toList();
    if (comicsIds.length >= 3) {
      comicsIds = comicsIds.sublist(0, 3);
    }
    _fetchRelatedHeroes();
  }

  void _fetchRelatedHeroes() async {
    try {
      for (var comicId in comicsIds) {
        HeroesResponseEntity response =
            await _getRelatedHeroesUsecase.call(comicId: comicId);
        for (var hero in response.heroes) {
          if (relatedHeroes.every((item) => item.id != hero.id)) {
            relatedHeroes.add(hero);
          }
        }
      }
      relatedHeroes.removeWhere((hero) => hero.id == selectedHero?.id);
    } catch (e) {
      Log.error(e.toString());
    } finally {
      isLoadingRelatedHeroes(false);
    }
  }

  void _setupTabs() {
    if (series != null) {
      tabHeaderTitles.add('Séries');
      tabContent.add(series!.heroes.isNotEmpty
          ? SeriesTabWidget(response: series!)
          : getNoInformationWidget());
    }

    if (events != null) {
      tabHeaderTitles.add('Eventos');
      tabContent.add(
        events!.heroes.isNotEmpty
            ? SeriesTabWidget(response: events!)
            : getNoInformationWidget(),
      );
    }

    if (comics != null) {
      tabHeaderTitles.add('Quadrinhos');
      tabContent.add(
        comics!.heroes.isNotEmpty
            ? ComicsTabWidget(response: comics!)
            : getNoInformationWidget(),
      );
    }
  }

  void _setupTabBar() {
    tabController = TabController(
      initialIndex: 0,
      length: tabHeaderTitles.length,
      vsync: this,
    );
    tabController.addListener(_changeTabListener);
  }

  void _changeTabListener() async {
    tabIndex.value = tabController.index;
  }

  Future<HeroesResponseEntity?> _fetchTabItemWhenSelected({
    required DetailTypeEnum type,
  }) async {
    try {
      return await _getHeroeDetailByTypeUsecase(
        id: selectedHero!.id,
        type: type,
      );
    } catch (e) {
      Log.error(e.toString());
    }

    return null;
  }

  void loadRelatedHero(HeroEntity hero) {
    _homeStore.selectedHero = hero;
    Get.toNamed(
      AppRoutes.home.heroDetails,
      preventDuplicates: false,
    );
  }

  Widget getNoInformationWidget() {
    return DefaultErrorWidget(
      title: 'Sem informações',
      subTitle:
          'No momento não temos nenhuma informação para esse item, mas não se preocupe, nossos heróis já estão resolvendo isso.',
      image: DSPngImagesEnum.noInformation,
    );
  }
}
