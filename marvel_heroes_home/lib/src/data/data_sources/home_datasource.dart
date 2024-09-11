import 'package:marvel_heroes_home/src/data/models/heroes_response_model.dart';

abstract class IHomeDataSource {
  Future<HeroesResponseModel> getHeroesList({required int offset});
}
