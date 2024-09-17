import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/domain/entities/heroes_response_entity.dart';

abstract class IGetHeroesListUsecase {
  Future<HeroesResponseEntity> call(
      {int? offset, int? id, String? query, OrderByEnum? order});
}
