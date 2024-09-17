import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/domain/entities/heroes_response_entity.dart';
import 'package:marvel_heroes_home/src/domain/repositories/get_hero_detail_by_type_repository.dart';
import 'package:marvel_heroes_home/src/domain/use_cases/get_hero_detail_by_type_use_case.dart';

class GetHeroeDetailByTypeUsecase implements IGetHeroeDetailByTypeUsecase {
  final IGetHeroeDetailByTypeRepository _getHeroeDetailByTypeRepository;

  GetHeroeDetailByTypeUsecase({
    required IGetHeroeDetailByTypeRepository getHeroeDetailByTypeRepository,
  }) : _getHeroeDetailByTypeRepository = getHeroeDetailByTypeRepository;

  @override
  Future<HeroesResponseEntity> call(
      {required int id, required DetailTypeEnum type}) {
    return _getHeroeDetailByTypeRepository.getHeroDetailByType(
      id: id,
      type: type,
    );
  }
}
