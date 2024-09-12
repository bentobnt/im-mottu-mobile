import 'package:marvel_heroes_home/src/domain/entities/heroes_response_entity.dart';
import 'package:marvel_heroes_home/src/infra/data_sources/home_datasource.dart';

abstract class IGetHeroeDetailByTypeUsecase {
  Future<HeroesResponseEntity> call({
    required int id,
    required DetailTypeEnum type,
  });
}
