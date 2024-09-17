import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/data/data_sources/home_datasource.dart';
import 'package:marvel_heroes_home/src/domain/entities/heroes_response_entity.dart';
import 'package:marvel_heroes_home/src/domain/repositories/get_hero_detail_by_type_repository.dart';

class GetHeroeDetailByTypeRepository
    implements IGetHeroeDetailByTypeRepository {
  final IHomeDataSource _homeDataSource;

  GetHeroeDetailByTypeRepository({
    required IHomeDataSource homeDataSource,
  }) : _homeDataSource = homeDataSource;

  @override
  Future<HeroesResponseEntity> getHeroDetailByType(
      {required int id, required DetailTypeEnum type}) {
    return _homeDataSource.getHeroDetailsByType(
      id: id,
      type: type,
    );
  }
}
