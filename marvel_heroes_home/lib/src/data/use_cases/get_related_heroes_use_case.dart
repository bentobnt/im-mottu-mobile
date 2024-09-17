import 'package:marvel_heroes_home/src/domain/entities/heroes_response_entity.dart';
import 'package:marvel_heroes_home/src/domain/repositories/get_related_heroes_repository.dart';
import 'package:marvel_heroes_home/src/domain/use_cases/get_related_heroes_use_case.dart';

class GetRelatedHeroesUsecase implements IGetRelatedHeroesUsecase {
  final IGetRelatedHeroesRepository _getRelatedHeroesRepository;

  GetRelatedHeroesUsecase({
    required IGetRelatedHeroesRepository getRelatedHeroesRepository,
  }) : _getRelatedHeroesRepository = getRelatedHeroesRepository;

  @override
  Future<HeroesResponseEntity> call({required int comicId}) {
    return _getRelatedHeroesRepository.getRelatedHeroes(comicId: comicId);
  }
}
