import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/domain/entities/hero_entity.dart';
import 'package:marvel_heroes_home/src/domain/entities/heroes_response_entity.dart';
import 'package:marvel_heroes_home/src/domain/use_cases/get_hero_detail_by_type_use_case.dart';
import 'package:marvel_heroes_home/src/infra/data_sources/home_datasource.dart';
import 'package:marvel_heroes_home/src/presentation/stores/home_store.dart';

class HeroDetailsController extends BaseController
    with GetTickerProviderStateMixin {
  RxBool isLoading = RxBool(true);
  RxBool showError = RxBool(false);
  RxInt tabIndex = RxInt(0);

  late TabController tabController;
  List<String> tabHeaderTitles = [];
  List<Widget> tabContent = [];

  final HomeStore _homeStore;
  late HeroEntity selectedHero;

  HeroesResponseEntity? series;
  HeroesResponseEntity? events;
  HeroesResponseEntity? comics;

  final IGetHeroeDetailByTypeUsecase _getHeroeDetailByTypeUsecase;

  HeroDetailsController({
    required HomeStore homeStore,
    required IGetHeroeDetailByTypeUsecase getHeroDetailByTypeUseCase,
  })  : _homeStore = homeStore,
        _getHeroeDetailByTypeUsecase = getHeroDetailByTypeUseCase;

  @override
  void onInit() {
    super.onInit();
    _loadHeroDetails();
  }

  @override
  void onClose() {
    tabController.removeListener(_changeTabListener);
    tabController.dispose();
    super.onClose();
  }

  void _loadHeroDetails() async {
    try {
      if (_homeStore.selectedHero != null) {
        selectedHero = _homeStore.selectedHero!;
      }

      series = await _fetchTabItemWhenSelected(type: DetailTypeEnum.series);
      events = await _fetchTabItemWhenSelected(type: DetailTypeEnum.events);
      comics = await _fetchTabItemWhenSelected(type: DetailTypeEnum.comics);

      _setupTabs();
      _setupTabBar();
    } catch (e) {
      showError(true);
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void _setupTabs() {
    if (series != null) {
      tabHeaderTitles.add('Séries');
      tabContent.add(series!.heroes.isNotEmpty
          ? _getContentTabSeries(series!)
          : _getNoInformationWidget());
    }

    if (events != null) {
      tabHeaderTitles.add('Eventos');
      tabContent.add(
        events!.heroes.isNotEmpty
            ? _getContentTabSeries(events!)
            : _getNoInformationWidget(),
      );
    }

    if (comics != null) {
      tabHeaderTitles.add('Quadrinhos');
      tabContent.add(
        comics!.heroes.isNotEmpty
            ? _getContentTabComics(comics!)
            : _getNoInformationWidget(),
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
        id: selectedHero.id,
        type: type,
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    return null;
  }

  Widget _getContentTabSeries(HeroesResponseEntity response) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: response.heroes.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          final title = response.heroes[index].title;
          final image = response.heroes[index].imageUrl;
          return Container(
            margin: EdgeInsets.symmetric(
              vertical: DSHeight.h_12.value,
              horizontal: DSHeight.h_16.value,
            ),
            decoration: BoxDecoration(
              color: DSColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    image ?? '',
                    height: DSHeight.h_112.value,
                    width: DsWidth.w_112.value,
                    fit: BoxFit.fill,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: DSHeight.h_8.value,
                    ),
                    child: Text(
                      title ?? '',
                      textAlign: TextAlign.start,
                      style: DSTextStyle.body.copyWith(
                        color: DSColors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _getContentTabComics(HeroesResponseEntity response) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: response.heroes.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final title = response.heroes[index].title;
          final image = response.heroes[index].imageUrl;
          return Container(
            width: DSHelper.width * 0.5,
            margin: EdgeInsets.symmetric(
              vertical: DSHeight.h_12.value,
              horizontal: DSHeight.h_16.value,
            ),
            decoration: BoxDecoration(
              color: DSColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    image ?? '',
                    width: DSHelper.width * 0.5,
                    height: DSHelper.height * 0.35,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: DSHeight.h_8.value),
                  child: Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    style: DSTextStyle.footnote.copyWith(
                      color: DSColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _getNoInformationWidget() {
    return DefaultErrorWidget(
      title: 'Sem informações',
      subTitle:
          'No momento não temos nenhuma informação para esse item, mas não se preocupe, nossos heróis já estão resolvendo isso.',
      image: DSPngImagesEnum.noInformation,
    );
  }
}
