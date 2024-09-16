import 'package:marvel_heroes_home/src/domain/entities/heroes_response_entity.dart';
import 'package:marvel_heroes_home/src/presentation/pages/home/home_controller.dart';

abstract class IGetHeroesListRepository {
  Future<HeroesResponseEntity> getHeroesList(
      {int? offset, int? id, String? query, OrderByEnum? order});
}
