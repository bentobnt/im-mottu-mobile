import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/data/data_sources/home_datasource.dart';
import 'package:marvel_heroes_home/src/data/repositories/get_hero_detail_by_type_repository.dart';
import 'package:marvel_heroes_home/src/data/use_cases/get_hero_detail_by_type_use_case.dart';
import 'package:marvel_heroes_home/src/domain/repositories/get_hero_detail_by_type_repository.dart';
import 'package:marvel_heroes_home/src/domain/use_cases/get_hero_detail_by_type_use_case.dart';

import '../../mocks/home_data_source_mock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Get.lazyPut<IGetHeroeDetailByTypeRepository>(
      () => GetHeroeDetailByTypeRepository(
        homeDataSource: Get.find(),
      ),
    );
    Get.lazyPut<IGetHeroeDetailByTypeUsecase>(
      () => GetHeroeDetailByTypeUsecase(
        getHeroeDetailByTypeRepository: Get.find(),
      ),
    );
  });

  tearDown(() {
    Get.deleteAll(force: true);
  });

  test("Fetch Hero Detail By Serie With Success Test", () async {
    Get.put<IHomeDataSource>(
      HomeDataSourceMock(
        successFetched: true,
      ),
    );

    var usecase = Get.find<IGetHeroeDetailByTypeUsecase>();

    await expectLater(
        usecase.call(id: 1011334, type: DetailTypeEnum.series), isNotNull);
  });

  test("Fetch Hero Detail By Comic With Success Test", () async {
    Get.put<IHomeDataSource>(
      HomeDataSourceMock(
        successFetched: true,
      ),
    );

    var usecase = Get.find<IGetHeroeDetailByTypeUsecase>();

    await expectLater(
        usecase.call(id: 1011334, type: DetailTypeEnum.comics), isNotNull);
  });

  test("Fetch Hero Detail By Event With Success Test", () async {
    Get.put<IHomeDataSource>(
      HomeDataSourceMock(
        successFetched: true,
      ),
    );

    var usecase = Get.find<IGetHeroeDetailByTypeUsecase>();

    await expectLater(
        usecase.call(id: 1011334, type: DetailTypeEnum.events), isNotNull);
  });

  test("Fetch Hero Detail By Type With Error Test", () async {
    Get.put<IHomeDataSource>(
      HomeDataSourceMock(
        successFetched: false,
      ),
    );

    var usecase = Get.find<IGetHeroeDetailByTypeUsecase>();

    String? errorMessage;

    try {
      await usecase.call(id: 1011334, type: DetailTypeEnum.comics);
    } catch (error) {
      errorMessage = error.toString();
    }

    expect(errorMessage, isNotNull);
  });
}
