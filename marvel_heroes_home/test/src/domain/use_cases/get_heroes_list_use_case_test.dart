import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/data/data_sources/home_datasource.dart';
import 'package:marvel_heroes_home/src/data/repositories/get_heroes_list_repository.dart';
import 'package:marvel_heroes_home/src/data/use_cases/get_heroes_list_use_case.dart';
import 'package:marvel_heroes_home/src/domain/entities/heroes_response_entity.dart';
import 'package:marvel_heroes_home/src/domain/repositories/get_heroes_list_repository.dart';
import 'package:marvel_heroes_home/src/domain/use_cases/get_heroes_list_use_case.dart';
import 'package:marvel_heroes_home/src/presentation/pages/home/home_controller.dart';

import '../../mocks/home_data_source_mock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Get.lazyPut<IGetHeroesListRepository>(
      () => GetHeroesListRepository(
        homeDataSource: Get.find(),
      ),
    );
    Get.lazyPut<IGetHeroesListUsecase>(
      () => GetHeroesListUsecase(
        getHeroesListRepository: Get.find(),
      ),
    );
  });

  tearDown(() {
    Get.deleteAll(force: true);
  });

  test("Fetch Heroes List With Success Test", () async {
    Get.put<IHomeDataSource>(
      HomeDataSourceMock(
        successFetched: true,
      ),
    );

    var usecase = Get.find<IGetHeroesListUsecase>();

    await expectLater(
        usecase.call(offset: 0, order: OrderByEnum.nameAsc), isNotNull);
  });

  test("Fetch Heroes List With Error Test", () async {
    Get.put<IHomeDataSource>(
      HomeDataSourceMock(
        successFetched: false,
      ),
    );

    var usecase = Get.find<IGetHeroesListUsecase>();

    String? errorMessage;

    try {
      await usecase.call(offset: 0, order: OrderByEnum.nameAsc);
    } catch (error) {
      errorMessage = error.toString();
    }

    expect(errorMessage, isNotNull);
  });

  test("Fetch Heroes List With Name Starts With Parameter Test", () async {
    Get.put<IHomeDataSource>(
      HomeDataSourceMock(),
    );

    var usecase = Get.find<IGetHeroesListUsecase>();

    String? errorMessage;
    HeroesResponseEntity? response;

    try {
      response = await usecase.call(offset: 0, query: '3');
    } catch (error) {
      errorMessage = error.toString();
    }

    expect(errorMessage, isNull);
    expect(response?.heroes.first.name, '3-D Man');
  });

  test("Fetch Heroes List With Order By Parameter Test", () async {
    Get.put<IHomeDataSource>(
      HomeDataSourceMock(),
    );

    var usecase = Get.find<IGetHeroesListUsecase>();

    String? errorMessage;
    HeroesResponseEntity? response;

    try {
      response = await usecase.call(offset: 0, order: OrderByEnum.nameDesc);
    } catch (error) {
      errorMessage = error.toString();
    }

    expect(errorMessage, isNull);
    expect(response?.heroes.first.name, 'A-Bomb (HAS)');
  });
}
