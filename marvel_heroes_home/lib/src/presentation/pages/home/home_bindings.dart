import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/data/data_sources/home_datasource.dart';
import 'package:marvel_heroes_home/src/data/repositories/get_heroes_list_repository.dart';
import 'package:marvel_heroes_home/src/data/use_cases/get_heroes_list_use_case.dart';
import 'package:marvel_heroes_home/src/domain/repositories/get_heroes_list_repository.dart';
import 'package:marvel_heroes_home/src/domain/use_cases/get_heroes_list_use_case.dart';
import 'package:marvel_heroes_home/src/infra/data_sources/home_datasource.dart';
import 'package:marvel_heroes_home/src/presentation/pages/home/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHomeDataSource>(
      () => HomeDataSource(
        httpProvider: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<IGetHeroesListRepository>(
      () => GetHeroesListRepository(
        homeDataSource: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<IGetHeroesListUsecase>(
      () => GetHeroesListUsecase(
        getHeroesListRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut(
      () => HomeController(
        getHeroesListUsecase: Get.find(),
      ),
      fenix: true,
    );
  }
}
