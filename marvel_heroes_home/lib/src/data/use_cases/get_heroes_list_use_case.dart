import 'package:marvel_heroes_home/src/domain/entities/heroes_response_entity.dart';
import 'package:marvel_heroes_home/src/domain/repositories/get_heroes_list_repository.dart';
import 'package:marvel_heroes_home/src/domain/use_cases/get_heroes_list_use_case.dart';

class GetHeroesListUsecase implements IGetHeroesListUsecase {
  final IGetHeroesListRepository _getHeroesListRepository;

  GetHeroesListUsecase({
    required IGetHeroesListRepository getHeroesListRepository,
  }) : _getHeroesListRepository = getHeroesListRepository;

  @override
  Future<HeroesResponseEntity> call({int? offset, int? id}) {
    return _getHeroesListRepository.getHeroesList(offset: offset, id: id);
  }
}
