import 'package:marvel_heroes_home/src/data/models/heroes_response_model.dart';
import 'package:marvel_heroes_home/src/infra/data_sources/home_datasource.dart';
import 'package:marvel_heroes_home/src/presentation/pages/home/home_controller.dart';

abstract class IHomeDataSource {
  Future<HeroesResponseModel> getHeroesList(
      {int? offset, int? id, String? query, OrderByEnum? order});
  Future<HeroesResponseModel> getHeroDetailsByType(
      {required int id, required DetailTypeEnum type});
  Future<HeroesResponseModel> getRelatedHeroes({required int comicId});
}
