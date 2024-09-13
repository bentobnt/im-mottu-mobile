import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/data/data_sources/home_datasource.dart';
import 'package:marvel_heroes_home/src/data/repositories/get_hero_detail_by_type_repository.dart';
import 'package:marvel_heroes_home/src/data/repositories/get_related_heroes_repository.dart';
import 'package:marvel_heroes_home/src/data/use_cases/get_hero_detail_by_type_use_case.dart';
import 'package:marvel_heroes_home/src/data/use_cases/get_related_heroes_use_case.dart';
import 'package:marvel_heroes_home/src/domain/repositories/get_hero_detail_by_type_repository.dart';
import 'package:marvel_heroes_home/src/domain/repositories/get_related_heroes_repository.dart';
import 'package:marvel_heroes_home/src/domain/use_cases/get_hero_detail_by_type_use_case.dart';
import 'package:marvel_heroes_home/src/domain/use_cases/get_related_heroes_use_case.dart';
import 'package:marvel_heroes_home/src/infra/data_sources/home_datasource.dart';
import 'package:marvel_heroes_home/src/presentation/pages/hero_details/hero_details_controller.dart';
import 'package:marvel_heroes_home/src/presentation/stores/home_store.dart';

class HeroDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHomeDataSource>(
      () => HomeDataSource(
        httpProvider: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<IGetRelatedHeroesRepository>(
      () => GetRelatedHeroesRepository(
        homeDataSource: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<IGetRelatedHeroesUsecase>(
      () => GetRelatedHeroesUsecase(
        getRelatedHeroesRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<IGetHeroeDetailByTypeRepository>(
      () => GetHeroeDetailByTypeRepository(
        homeDataSource: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<IGetHeroeDetailByTypeUsecase>(
      () => GetHeroeDetailByTypeUsecase(
        getHeroeDetailByTypeRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<HomeStore>(
      () => HomeStore(),
      fenix: true,
    );

    Get.lazyPut(
      () => HeroDetailsController(
        homeStore: Get.find(),
        getHeroDetailByTypeUseCase: Get.find(),
        getRelatedHeroesUsecase: Get.find(),
      ),
      fenix: true,
    );
  }
}
