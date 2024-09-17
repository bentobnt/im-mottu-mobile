import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/data/data_sources/home_datasource.dart';
import 'package:marvel_heroes_home/src/domain/entities/heroes_response_entity.dart';
import 'package:marvel_heroes_home/src/domain/repositories/get_heroes_list_repository.dart';

class GetHeroesListRepository implements IGetHeroesListRepository {
  final IHomeDataSource _homeDataSource;

  GetHeroesListRepository({
    required IHomeDataSource homeDataSource,
  }) : _homeDataSource = homeDataSource;

  @override
  Future<HeroesResponseEntity> getHeroesList(
      {int? offset, int? id, String? query, OrderByEnum? order}) {
    return _homeDataSource.getHeroesList(
        offset: offset, id: id, query: query, order: order);
  }
}
