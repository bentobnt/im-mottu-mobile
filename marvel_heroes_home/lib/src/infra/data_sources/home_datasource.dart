import 'package:marvel_heroes_home/src/data/data_sources/home_datasource.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/data/models/heroes_response_model.dart';

enum DetailTypeEnum {
  events('events'),
  comics('comics'),
  series('series'),
  stories('stories');

  final String value;

  const DetailTypeEnum(this.value);
}

class HomeDataSource implements IHomeDataSource {
  final IDioProvider _httpProvider;

  const HomeDataSource({
    required IDioProvider httpProvider,
  }) : _httpProvider = httpProvider;

  @override
  Future<HeroesResponseModel> getHeroesList({int? offset, int? id}) async {
    try {
      final url = id != null ? '/characters/$id' : '/characters';
      Map<String, dynamic> parameters = id != null
          ? {}
          : {
              'offset': offset,
              'limit': 100,
            };

      final request = HttpRequest(
        url: url,
        queryParameters: parameters,
      );

      final response = await _httpProvider.get(request);

      return HeroesResponseModel.fromJson(response.data["data"]);
    } catch (e) {
      Log.error(e.toString());
      throw Exception(
        ServicesErrorHandle.decodeError(e),
      );
    }
  }

  @override
  Future<HeroesResponseModel> getHeroDetailsByType({
    required int id,
    required DetailTypeEnum type,
  }) async {
    try {
      final request = HttpRequest(
        url: '/characters/$id/${type.value}',
      );

      final response = await _httpProvider.get(request);

      return HeroesResponseModel.fromJson(response.data["data"]);
    } catch (e) {
      Log.error(e.toString());
      throw Exception(
        ServicesErrorHandle.decodeError(e),
      );
    }
  }

  @override
  Future<HeroesResponseModel> getRelatedHeroes({
    required int comicId,
  }) async {
    try {
      final request = HttpRequest(
        url: '/comics/$comicId/characters',
      );

      final response = await _httpProvider.get(request);

      return HeroesResponseModel.fromJson(response.data["data"]);
    } catch (e) {
      Log.error(e.toString());
      throw Exception(
        ServicesErrorHandle.decodeError(e),
      );
    }
  }
}
