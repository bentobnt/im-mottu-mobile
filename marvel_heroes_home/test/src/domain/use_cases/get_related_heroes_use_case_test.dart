import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/data/data_sources/home_datasource.dart';
import 'package:marvel_heroes_home/src/data/repositories/get_related_heroes_repository.dart';
import 'package:marvel_heroes_home/src/data/use_cases/get_related_heroes_use_case.dart';
import 'package:marvel_heroes_home/src/domain/repositories/get_related_heroes_repository.dart';
import 'package:marvel_heroes_home/src/domain/use_cases/get_related_heroes_use_case.dart';

import '../../mocks/home_data_source_mock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Get.lazyPut<IGetRelatedHeroesRepository>(
      () => GetRelatedHeroesRepository(
        homeDataSource: Get.find(),
      ),
    );
    Get.lazyPut<IGetRelatedHeroesUsecase>(
      () => GetRelatedHeroesUsecase(
        getRelatedHeroesRepository: Get.find(),
      ),
    );
  });

  tearDown(() {
    Get.deleteAll(force: true);
  });

  test("Fetch Related Heroes With Success Test", () async {
    Get.put<IHomeDataSource>(
      HomeDataSourceMock(
        successFetched: true,
      ),
    );

    var usecase = Get.find<IGetRelatedHeroesUsecase>();

    await expectLater(
        usecase.call(comicId: 22506), isNotNull);
  });

  test("Fetch Related Heroes With Error Test", () async {
    Get.put<IHomeDataSource>(
      HomeDataSourceMock(
        successFetched: false,
      ),
    );

    var usecase = Get.find<IGetRelatedHeroesUsecase>();

    String? errorMessage;

    try {
      await usecase.call(comicId: 22506);
    } catch (error) {
      errorMessage = error.toString();
    }

    expect(errorMessage, isNotNull);
  });
}
