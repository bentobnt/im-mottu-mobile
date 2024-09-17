import 'package:marvel_heroes_home/src/data/data_sources/home_datasource.dart';
import 'package:marvel_heroes_home/src/domain/entities/heroes_response_entity.dart';
import 'package:marvel_heroes_home/src/domain/repositories/get_related_heroes_repository.dart';

class GetRelatedHeroesRepository implements IGetRelatedHeroesRepository {
  final IHomeDataSource _homeDataSource;

  GetRelatedHeroesRepository({
    required IHomeDataSource homeDataSource,
  }) : _homeDataSource = homeDataSource;

  @override
  Future<HeroesResponseEntity> getRelatedHeroes({required int comicId}) {
    return _homeDataSource.getRelatedHeroes(comicId: comicId);
  }
}
