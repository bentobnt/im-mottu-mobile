import 'package:marvel_heroes_home/src/data/data_sources/home_datasource.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';
import 'package:marvel_heroes_home/src/data/models/heroes_response_model.dart';

class HomeDataSource implements IHomeDataSource {
  final IDioProvider _httpProvider;

  const HomeDataSource({
    required IDioProvider httpProvider,
  }) : _httpProvider = httpProvider;

  @override
  Future<HeroesResponseModel> getHeroesList({required int offset}) async {
    try {
      final request = HttpRequest(
        url: '/characters',
        queryParameters: {
          'offset': offset,
        },
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
