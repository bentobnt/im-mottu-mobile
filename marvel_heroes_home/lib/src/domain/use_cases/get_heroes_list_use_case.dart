import 'package:marvel_heroes_home/src/domain/entities/heroes_response_entity.dart';

abstract class IGetHeroesListUsecase {
  Future<HeroesResponseEntity> call();
}
