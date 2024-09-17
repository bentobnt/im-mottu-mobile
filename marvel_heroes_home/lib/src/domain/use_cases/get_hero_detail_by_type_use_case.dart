import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/domain/entities/heroes_response_entity.dart';

abstract class IGetHeroeDetailByTypeUsecase {
  Future<HeroesResponseEntity> call({
    required int id,
    required DetailTypeEnum type,
  });
}
