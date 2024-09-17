import 'package:marvel_heroes_home/src/domain/entities/heroes_response_entity.dart';

abstract class IGetRelatedHeroesUsecase {
  Future<HeroesResponseEntity> call({required int comicId});
}
